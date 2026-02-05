Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKRYMpfvg2mtvwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 02:17:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB06ED9AF
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 02:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2F310E1B1;
	Thu,  5 Feb 2026 01:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fQS/j/AW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF43B10E1B1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 01:17:06 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-894774491deso5262896d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 17:17:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770254226; cv=none;
 d=google.com; s=arc-20240605;
 b=IKxxpGo30HuNHTqs370xQIkOiApAuXYj7OlVGwIbtx6HufFQ4gYXpOZDJmwRAl9eBl
 N1ryYG/gNHA0lfTlSDKOXZXL+z+4vFq7dnJ9eRVZxzq40qbMastKjZTTgRQxSbMrChA7
 o6ahnDIIJM9NJp8WCXxkRJ2kQQcvo11Rs/zWUYVI5aKDPybpVIPUWMX665Y1eAgFXY8v
 v+fnzJ2UcaoeQlN7ZwaysqQhiGhf6TvB5nzA20n4XofEn818M2KHhu2XvEG4Acnxzm2L
 hGZEZ6AvNV4EutfVdxnbOL9sVoJM3m5LIKkojc/qLmxAY3ZrmAUsQt+KQqIBhvJXZVJr
 Vq+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ntSsjDrT6gFPJG7wr+cNV3lFf1pqXWoAkMREwhIEauk=;
 fh=2gbGUTfIrwzcanWjH10qas6+N0CE8W5HRD0ePPN6IfI=;
 b=SzH9HhpmRPYpc/0f/P5pOxFTXcvw4UEqG2rHIQOpGJVNNAJkBOMXPvBNy3A6tEnjcQ
 fo88OrmRjdBBK+4LChGMWuFd/+2Ae1/tZPIWEBT0oajyiz3zV6B9QxTsO7PfiFA1f3C/
 ZB4PbtwhpgD7/H8yzpyFax3Jm/sC2YtQM4lw+SGGK/i3YogzOWK0KPJSNUtLmCbX0881
 F32JYQgrAIZntL9E3lfQ1PjG2Mo9cuOW95uNu97NfJAuX4n0kf3r7rKoEDXj4eZ9D8c1
 1XfjRaHTRztWHFIYBWYOI17xFQbZ2mA1no28O0/imO6Ol3nkrZZeL3Hw+z9AaPOHvy2u
 WQQg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770254226; x=1770859026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ntSsjDrT6gFPJG7wr+cNV3lFf1pqXWoAkMREwhIEauk=;
 b=fQS/j/AWlHB16CatltR/0pIvDsGGJFfdb6UrM8YDftN+0mCdJ7NMnq2dYQAoN3/TH3
 ddk/73xknL0OvSO67S7FJgd5uNiN2m1p3MsWzoz34arBNHULedqO1id3kFqePz8/nZ0U
 tNSgxLFJ6ftoinl8k4loLJC+wD13DIyCg+ZLVGVjhQpI0NXRDr3jCNy2qa94uKj8eXoT
 LKIGzUbyijaERZqf7jwT3EWI+bdKgIazuxtebTti8KksCAHDEtEMbdVG9JkNepS+OaaZ
 4RiWIkmx4VFK3cPj3yoBjvQX7brnkvRkFpjB86TMP1s639CK7GsL9/346piUB3AbLXGl
 m3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770254226; x=1770859026;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ntSsjDrT6gFPJG7wr+cNV3lFf1pqXWoAkMREwhIEauk=;
 b=NcxRA3mP+jqy5G7xupXAsel5n8rKKz8INHbMV5dcYZQpS52EbZr87VLN6VwEKUM7x+
 ZORxyife2e/B0WR1AvkFisCrR+aAz02E/A8SjIm6dbj/+akf31SWfY6bvHmgzzJ76KWn
 lhHeMYT1yFeUgyJdypr6QwCgwcnWq32tHLEk7m4q7i07GuxAhXwA74HRuQNHdAY2HPqq
 gIuM/HMtVTPBUHTdbhY2C+dQIYYhSSSpqAnaRb0vNhJhD/6UMsqJOSNaHpfxVWTI7ME4
 jlGn3tQ+w7U8FMNbHYpsGcFMN8rMWjFkHSqFIORpfO+I7pl4wiEVFDLLB1OeENIw8uD+
 D54g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEm2qCY9/5PM3z5FFl9sf7rJHsQt71ucAJu1RpnUNolT5dwduBuyOe+IeS2/J671lRSTHCtEIP/e4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3HOJVEUgGANRBhuzJT48QVpNZKaRqST+yMTHH6Cbzefw54Xki
 Q77RDfdOmq0jUljFCCIVm9P2WusbMIhLiA4s5JDKAdSvhUcLMsavX22mppLfJSeY+pxNn0XhwVf
 DwFJhgDVCsnIq4EAy/0lBrQVJ0N6L7J6sgVVk
X-Gm-Gg: AZuq6aIhaaNFg9ga+s/NbU+8ifsh6ogal0tb6gn9xiOOrDziwWS6vGR3yDaV2F6Ot1B
 UoUKgkpkcmEnITKg5y9p8y47y2if5IEy+/t3S+iD8uWsByQ3kcSnmHDg1b5yDBJm3k1TwlJLXfv
 hRq3hvhBbWQgwjg0RYKeDCWKASsoBcUSUyQqchTCpPH8NMXygxsS0WwZ2X7qToHOoygM8NUka2E
 g0KEW8NThlYkHGpQg4lZAqiUtUDTJVDPmwmr8br8tJEt0YSjWLCOBoxsiUVdrjrGb52fAADzSp1
 KcXclQfe+lnavq5fqE2C9gzN7g9cKgy1Gqg7SW2vKmfMLyCTUCfBseg=
X-Received: by 2002:a05:6214:f24:b0:880:4695:4626 with SMTP id
 6a1803df08f44-8952210a461mr76499426d6.15.1770254225864; Wed, 04 Feb 2026
 17:17:05 -0800 (PST)
MIME-Version: 1.0
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
 <CAAgWFh2dHZs2D7R4ejY9sNQ+QCtLQeGGS2PNtcsm_MPeV3edLw@mail.gmail.com>
 <Z-VX3TJPI6Tgin2G@cassiopeiae>
 <CAAgWFh3c=qE+c8Q04W2NXpBLBeXC12qTKLNmZeJA65m+dTMG8Q@mail.gmail.com>
 <Z-aDWWUTN1MBI_wl@pollux>
In-Reply-To: <Z-aDWWUTN1MBI_wl@pollux>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Feb 2026 11:16:54 +1000
X-Gm-Features: AZwV_QjjAR5F4LRGudoGX_LBZTUK98t7D34f4x-i5o_eEqpfv_AC_cbr4n1mZ3U
Message-ID: <CAPM=9txXG=tqrDjhXXvfQ+eMRnsVab=xz4CBOd1Nzwu3XR+DyA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
To: Danilo Krummrich <dakr@kernel.org>
Cc: M Henning <mhenning@darkrefraction.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, bskeggs@nvidia.com, jhubbard@nvidia.com, 
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:mhenning@darkrefraction.com,m:kherbst@redhat.com,m:lyude@redhat.com,m:bskeggs@nvidia.com,m:jhubbard@nvidia.com,m:faith.ekstrand@collabora.com,m:nouveau@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2EB06ED9AF
X-Rspamd-Action: no action

On Fri, 28 Mar 2025 at 21:09, Danilo Krummrich <dakr@kernel.org> wrote:
>
> (CC: Ben, John)
>
> On Thu, Mar 27, 2025 at 02:03:21PM -0400, M Henning wrote:
> > On Thu, Mar 27, 2025 at 9:51=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Fri, Mar 21, 2025 at 06:06:34PM -0400, M Henning wrote:
> > > > On Thu, Mar 20, 2025 at 2:18=E2=80=AFPM Danilo Krummrich <dakr@kern=
el.org> wrote:
> > > > > On Wed, Mar 12, 2025 at 05:36:14PM -0400, Mel Henning wrote:
> > > > > > +     __u32 width_align_pixels;
> > > > > > +     __u32 height_align_pixels;
> > > > > > +     __u32 pixel_squares_by_aliquots;
> > > > > > +     __u32 aliquot_total;
> > > > > > +     __u32 zcull_region_byte_multiplier;
> > > > > > +     __u32 zcull_region_header_size;
> > > > > > +     __u32 zcull_subregion_header_size;
> > > > > > +     __u32 subregion_count;
> > > > > > +     __u32 subregion_width_align_pixels;
> > > > > > +     __u32 subregion_height_align_pixels;
> > > > > > +
> > > > > > +     __u32 ctxsw_size;
> > > > > > +     __u32 ctxsw_align;
> > > > > > +};
> > > > >
> > > > > What if this ever changes between hardware revisions or firmware =
versions?
> > > >
> > > > There was some previous discussion of that here:
> > > > https://gitlab.freedesktop.org/mesa/mesa/-/issues/12596#note_279685=
3
> > > >
> > > > From what I can tell, this structure hasn't really changed since
> > > > FERMI_C (circa 2011), so I'm not too worried about it changing on u=
s
> > > > too quickly. When it does change, we have the option of appending m=
ore
> > > > members to this struct in the usual way, or if the change is more
> > > > fundamental we can return an error from this ioctl and add a new
> > > > interface. Userspace needs to handle an error from this ioctl
> > > > gracefully anyway since whether it works or not depends on the gpu
> > > > generation and what firmware is loaded right now.
> > >
> > > We could also define it as
> > >
> > >         struct drm_nouveau_get_zcull_info {
> > >                 __u32 version;
> > >                 __u32 _pad;
> > >
> > >                 union {
> > >                         struct drm_nouveau_get_zcull_info_v1 info;
> > >                 }
> > >         }
> > >
> > > just to be safe.
> >
> > We can do that, although I don't see any other drm drivers using a
> > similar pattern anywhere.
>
> I think it's a bit cleaner than adding new members, leave existing ones u=
nset or
> add a new IOCTL in the worst case.
>
> Maybe the NVIDIA folks can give us some hint on whether this is expected =
to
> change at some point?

I think it's an ioctl, let's just leave out version/pad, adding a new
ioctl isn't a major trouble if the world decides we need to do it.

Also you can extend ioctls with new fields at the end without
problems, so if it's just extra info it'll likely be hw specific and
be part of enabling a new GPU.

Dave.
