Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHGfLafng2n+vQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 01:43:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A2DED788
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 01:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268F110E783;
	Thu,  5 Feb 2026 00:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nD21dSDh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859C110E783
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 00:43:15 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-8947404b367so4740326d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 16:43:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770252194; cv=none;
 d=google.com; s=arc-20240605;
 b=cBDLEtHEzeBPzJ2t6+AtvQNv6n7v3ybfYFoFm75zgXj3ETO/MtKcgxmqrS3NF78/mG
 KowIgNkefYd4Tu3jNlH0XnJAVzdczSIygPR/S43xf8xFoe1VArCucSOyEZ/mI1aDMnqi
 DahkwWHL2P0A4SIC15PVz25H8zMQk6nr/dniCU5/RUmOJCgSq+jvzC3776n+SX00RF3F
 eAYf3d4Dd10+E1wGhdISKdSgAIozN3lmiQvffrY5ObTE0vNKbcNzatvTgS+/z/WVwwWR
 lNl+t1FzrbIl2/X65GkbxOTss6zFKO9RDUPUEyMEARCE4+HUajkexDAR6twBLg4ynoct
 642Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MzvltOhqnqKNwuA8d7pZMRKKiJmiYA4xpLV5cbdudZk=;
 fh=LXwb32ybF8WGuqG9LrsiyCGZsVIfFAZOvkMzmsG7NvY=;
 b=Yvwq7t82ShrSxUQV82doGGa/aOEfwuJtefaUV4NHamUOv/6DkLZXiwQ3AvVKDXy9T6
 sItmhb9avoP7mrd/zWPy09c/Vfs4ZgITZhZ3MFoYn+1BWj03LGZlC1xNw6Cun6DYSAaf
 1zILEQhAPPO9Zeu82dKQFlEQ+cDTSgPh8SLzg3wl1ifoD4T264Ft8SjQuPcoV8YjXWJs
 WxyloADxjKgzLcMBfm2aoGmGfo1eAC18UEiUQfqAjucD6ct93sr6tnglNiF1E5vo7Ad7
 FAWJ43tUH7CRwr+RctwweSISYPX0mfKCOogIkhwvhVBFUKTKFv7ROMm9JwbeK/0aFJXH
 whcQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770252194; x=1770856994; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MzvltOhqnqKNwuA8d7pZMRKKiJmiYA4xpLV5cbdudZk=;
 b=nD21dSDh8i88qC+7m120uLxGKOhVms44+sm18S8TvjdN8q21C/4kNMI3og2Th7Gpb3
 iIFjDKit/HTnRL1xgoESJZ2u9AuMz1oZXgE6F59h6lgDdOuaVECs+dLYvVtvqxJ3EdpU
 nx8zMWkZ7Jsx4Or2wkDdFRzWiIuarmMvpaZI/prcqwXw/tZJ1wpBmgHRdWTD0IDijIHF
 HAY8o8InxrAWqkzehm+EEErJ/QDo+hN6KlXRO0umPN8vQB3xn2GMFF6cB+rwUvSx5vyA
 B36OmYRd6WbqsJp0sXhonsV1X/7cqkqPY9QyA1zgKTvAcIY7PdRawviQwVpDeQvWGInf
 5kkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770252194; x=1770856994;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MzvltOhqnqKNwuA8d7pZMRKKiJmiYA4xpLV5cbdudZk=;
 b=ExgSzc3ukzhccxsUkFWRX86DzJUNaGnYs3UjWQlYlUJycV56WRVujHszEXShdOGKxw
 CINdLIFgEUJx6aB19Is6/9OnshaafVKqbghSdqOuY0M+6GzOX9b1CNk7jLgz1IC/C8Rf
 H4KkFm5zKwg1caCP5cqPKGMrH9Io2sDvK6gwMV2u0jO0NC5yaShOytRoPdKXV5RqvyWZ
 KoG5vk+By07qcYrRrdp6sI6dpC/P1aWbdKkrMUgporGep5cz5eF7YkwqDGaim6O1a4Lz
 T8iG73HHq2QlBWFTdYE3OQH/ttnvKLELtj7pm9OuKGf0h8rLoRfD/+qOttA1Jnz427Dd
 nk7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQJXVYGuC8aoXuGx48BGkOIGo3GDWx+t5D2GKnakKAYfCpzK0RG4GTI6kqYskGJlvCm4yFWbhM/LY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOvbTCvCXep7R0X38pDjM27HnN946aP1oyaIdsjob3X2Aotzzr
 PqGSi01G+rZsPvLPqic2QxyqUK/ixL/XB4jj930oj4o7F27EDgkqwAP75FumN40G9H1QxUdGmeN
 sz9nWQn6d8H+5WXUUQCzqUtO4zbjE1OE=
X-Gm-Gg: AZuq6aKPfKR/ELJCsCiddqmgfaqmpcNHivz/W8awgUNO3nIzwHNWCf/A+Pne5zITZy/
 UnQV43QRa2rU1qp4uJlzkqkp6f9XiqsWMArW4pnjKWfU6Dmge40NxtYp+ujNbflI+FirMdaN9Ta
 Km2GR/G7iQ/S/HCxjZ3IWRYn2Q1NmdPDdE6GchiTvichrkDWHCBblH61pa+1Bl4KKOJfQwmJRIO
 8ZZsmTJLqVsurc+oJRUomzwvbnpU2ziA5HxQNo+w+1oShgp9LU87n+oJ4y7161IWgNB+glNn17i
 0fVMYMWs80hGWG+QT+chDAqvHfT5vzTD6HfI7os78n0ETkqwA1StJVA=
X-Received: by 2002:ad4:404e:0:b0:895:829:485d with SMTP id
 6a1803df08f44-895220f3ae2mr45357786d6.10.1770252194314; Wed, 04 Feb 2026
 16:43:14 -0800 (PST)
MIME-Version: 1.0
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
 <abcc6ddc-47d5-4970-8fc1-e82c150fbfd9@nvidia.com> <Z9x0NLY6HHsvxOFD@pollux>
 <CAAgWFh1VzRnt9QdCR9xOVhar7vEYAGPBcMHfqXGq_QHm0A6H8Q@mail.gmail.com>
 <Z-VK8eeA_7BURiBy@cassiopeiae>
 <CAAgWFh1yGZkEi+Fr9htOp+iXJjLo6Q1B+rszKKAcxgw4Y0D1RQ@mail.gmail.com>
 <Z-aCVZYcEkxJHBle@pollux>
In-Reply-To: <Z-aCVZYcEkxJHBle@pollux>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Feb 2026 10:43:03 +1000
X-Gm-Features: AZwV_QiYqwvgKCbIcsEv5BKiMdyjneUelMqhYPudieJPgw4RFOKnTMKYYmxe1Kc
Message-ID: <CAPM=9txDN8NtX2UFfo8KtkaqW_rgM7oE-nLC+XyaOEAS6sj-qg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
To: Danilo Krummrich <dakr@kernel.org>
Cc: M Henning <mhenning@darkrefraction.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:mhenning@darkrefraction.com,m:bskeggs@nvidia.com,m:kherbst@redhat.com,m:lyude@redhat.com,m:faith.ekstrand@collabora.com,m:nouveau@lists.freedesktop.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F3A2DED788
X-Rspamd-Action: no action

On Fri, 28 Mar 2025 at 21:12, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Thu, Mar 27, 2025 at 02:26:09PM -0400, M Henning wrote:
> > On Thu, Mar 27, 2025 at 8:56=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Tue, Mar 25, 2025 at 07:40:56PM -0400, M Henning wrote:
> > > > Okay, that sounds reasonable since I don't expect this to change ve=
ry quickly.
> > > >
> > > > Since I don't fully understand, is the suggestion here to:
> > > > 1) add the interface as a function on nvkm_gr using the nvkm_gr_fun=
c
> > > > vtable and store the actual data on r535_gr
> > > > or
> > > > 2) add the interface to NVIF (which IF?) and store the actual data =
on nvkm_gr
> > > > ?
> > >
> > > I think we want both.
> > >
> > > 1) I think the suggestion was to store the data directly in nvkm_gr, =
however the
> > >    structure is indeed specific to r535, so I think, unfortunately, w=
e need the
> > >    vtable and store that data in r535_gr.
> >
> > Well, NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS is r535-specific, but we
> > need to convert it into a common structure and combine it with info
> > from NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES at some point, so
> > I think it makes sense to do that conversion+combination before
> > storing it on any structure. In that case, maybe we store the
> > structure on nvkm_gr directly during r535_gr_oneinit and then the call
> > to get the info only goes through NVIF?
>
> Sounds good to me! It means you need an intermediate structure though, we=
 should
> avoid using uAPI structures in NVKM code.

I don't think we need to go through NVIF, or at least we could do it,
but there is no gr object exposed through it now and adding a whole
load of gr code to nvif would be a nightmare, I'd rather we merged the
kill nvif patches.

I think not using the uapi struct in nvkm is all we need to maintain,
nvkm has it's structure, uapi has it's structure and we just pass
between them. nvkm_gr_units already exists as an nvif bypass so I
think it's probably fine.

Dave.
