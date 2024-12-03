Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392919E2941
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 18:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D0110EADB;
	Tue,  3 Dec 2024 17:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="1Gbf6dKm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31CB10EADB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 17:29:00 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5d0c5c8cb5cso13a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 09:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733246939; x=1733851739;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8zEoxOgatX3OgU4qGavIbeS/jNtTx+aBW797DF25fM4=;
 b=1Gbf6dKmDRDnGW8+w+LhxFBO+tEE+c99FgtYcXotLG13E7ap8ZBFYDLHzWiyqikSZ9
 /EVrRRPqp2m1oOQKmmzbrg0cx8qBFdrLahRBT2h0ieKh3DJKUN1PtZMRUSAtP29AAtDQ
 HFd6dihWmgJIsAEfjGM38PK6ssnnhmo5Kw3WXmKyKy6smfWYoZ8MZOHp6l4UnsXNw5Uz
 uZ058VrHI0jY/lCP5od3S60Weh2obuPx0JRTAYEHa9oUSUHZbrRmpJqX3KlEBf6khvx4
 3F7DWVMnc12iCekNAQ3qyYL7UO+EbgocOLDrBzjkcLAB86OczUu9QSkxJ3uSb+bWcVuY
 b8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733246939; x=1733851739;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8zEoxOgatX3OgU4qGavIbeS/jNtTx+aBW797DF25fM4=;
 b=KaXAxpqJ+VPhv26673I3M8+/1/ybRLwrJu0fEMnYZd0+ahHumo2eW5oElbuWjmigD5
 OoKsjdxzVUZmohrHZs5gWAtZClfJFOzZUtvTtQ5OWbqYKSr0X/nTd5xgTXnnDn1q6Zm6
 zJAu/4tNEZ51lO6Tzaqt18CN83jRRmBzlzblbH7pq4Bp47PwZRjzD35HvHLLsdcpkZmy
 osDBMMx4zo/RyLI2cNWWnSUENM6OWuly4+ggIMBJVIBcc0B4fz94QgWhIqXmLOoWX7Fc
 KViJKm9toXH0nRGvgOqm0Oi/g37wWL3N/R74D6H3+UWQ0E78TEhkP8emndcdK/HYAbz8
 e9yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAOWWh1Djrw9XEMZATxBnA1BcGdW5aS11RFSsiPxokuvzjnH/ga1qnm48MtWtF2/lJ83fV0bOBDn8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxql0BP6EJbOcTrez+Ywos8WYA9EwnLd/RR8W+DZYEm9x7c/h1T
 R9+2F5aGjz2phBzkbkHQbC4lzRmNNEnUG24OUH1muDMSqHWToWNm2u4XS3MREHUibLkHS75rF/q
 z8Yj7JAUOPBy36b25LYS1YfexpkhEmW5s1Hbt
X-Gm-Gg: ASbGncukfkfUuoEsrQIcRB8NL49ITAfctIsXfDvTsGoLnoCJ7QJGV3iW9w2nkbxkLmR
 mZ50cwFL06J0BiqEGh/IeZSRzCKLUkzojHRm+OHjZj+1Ob2SDMC8CBLeKp2E=
X-Google-Smtp-Source: AGHT+IEkU+zbQ8W8SOhd2ZkEGWuPQgYxHAiQC9NmnbLpt2BY3rA5dILHt1/UpotcudtM7dqmvzlcwmUDruhX9bjJ3gM=
X-Received: by 2002:aa7:cb98:0:b0:5d1:10a4:de9 with SMTP id
 4fb4d7f45d1cf-5d110a40e94mr50781a12.7.1733246938492; Tue, 03 Dec 2024
 09:28:58 -0800 (PST)
MIME-Version: 1.0
References: <CAG48ez0w8HrFEZtJkfmkVKFDhE5aP7nz=obrimeTgpD+StkV9w@mail.gmail.com>
 <IA0PR11MB7185E2589D638EF287E627E0F8362@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7185E2589D638EF287E627E0F8362@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 3 Dec 2024 18:28:22 +0100
Message-ID: <CAG48ez0SOLxkpYyB=AiZBSPAxA7UFiFmyXW70Jq2OFKjsTV5HA@mail.gmail.com>
Subject: Re: udmabuf: check_memfd_seals() is racy
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Julian Orth <ju.orth@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Linux-MM <linux-mm@kvack.org>
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

On Tue, Dec 3, 2024 at 9:25=E2=80=AFAM Kasireddy, Vivek
<vivek.kasireddy@intel.com> wrote:
> > Julian Orth reported at
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D219106 that
> Thank you for reporting this bug.
>
> > udmabuf_create() checks for F_SEAL_WRITE in a racy way, so a udmabuf
> > can end up holding references to pages in a write-sealed memfd, which
> > theoretically breaks one of the security properties of memfd sealing.
> > See also the discussion starting at
> > <https://lore.kernel.org/linux-
> > mm/CAHijbEV6wtTQy01djSfWBJksq4AEoZ=3DKYUsaKEKNSXbTTSM-
> > Ww@mail.gmail.com/>.
> AFAICS, this problem does not adversely affect the main user of udmabuf d=
river
> (Qemu) given that Qemu adds F_SEAL_SEAL while creating the memfd but
> I can see how other users of udmabuf driver might be impacted by this iss=
ue.

The issue is that in theory, a nefarious process could maybe abuse
udmabuf to write to a memfd that is supposed to be sealed. This could
violate the assumption that a F_SEAL_WRITE-sealed memfd's memory is
immutable in another process. So the affected process wouldn't have to
be aware of udmabuf at all.

> > I think one possible correct pattern would be something like:
> >
> > mapping_map_writable() [with error bailout]
> > check seals with F_GET_SEALS
> > udmabuf_pin_folios()
> > mapping_unmap_writable()
> I believe this should probably work as mapping_map_writable() would preve=
nt
> F_SEAL_WRITE from getting added later. Do you plan to send a patch to fix
> this issue in udmabuf driver?

Yes, I just sent fixes for this issue and two others at
<https://lore.kernel.org/all/20241203-udmabuf-fixes-v1-0-f99281c345aa@googl=
e.com/>
(though I went with the inode lock instead of mapping_map_writable()
to keep things simpler).
