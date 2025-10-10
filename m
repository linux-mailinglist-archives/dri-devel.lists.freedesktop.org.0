Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5638BCE29A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 19:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC09210EC74;
	Fri, 10 Oct 2025 17:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="avIvgwUQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f100.google.com (mail-io1-f100.google.com
 [209.85.166.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FAE10EC77
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 17:51:56 +0000 (UTC)
Received: by mail-io1-f100.google.com with SMTP id
 ca18e2360f4ac-912d4135379so95665739f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 10:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760118716; x=1760723516;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0OPb16XAxCxkWaCKR+sCUkPkjLd22eeuyEg2QTbZKaY=;
 b=dAbvybZPwZkyxvTqOeU/XxLXz4jyLqNVJCBATOXX0F6R/5avvRSY2B1YtIIEWJebqe
 9GPaIThDDvyCg04eUlBWgKX1vQDP/Lz4P0lAXR8chAVJvWWIc04GXRUlShMZYXByfsQe
 OqFL+XyaqYdwXIqYIfsrEACq0blZQiCHevjv78dE3hHFOkUy1KxWQCKGQgNzeRmapXKM
 THsJGMviu5GFiO9PvgMNUgjSTyS0q1umQCM7HzpDl0HaNHo1vN4BSbsRnGw66rM0zLuX
 t9UR7l8oCUAZ36peDHmZoz/pPv1djFUdfhitcGmziEzo3MycLIfHvILJPimNkSEqkBdi
 l/zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1423ckOLEIshimYrTeKKXeeuQnSLvzLiXCgbaEGgJojC8+El9JdoDhILiGwiKhlfGJnw/P+usgmg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdRDsQhFlGPm/WER4xB+vmJBeZYON0KBgSAmLNeM1xtoSCxf29
 EuuDNu8Y8hFzmiIciY4011ytYWUfAq2CJg40jW4MHD1bkYDp5t3jTLgu16KLkwR6WbW4KsJWCAf
 YNzpuTc3VibjWEFXF1jXJxgV/5t4MgW2omypNfKnUvJMJLcBgE6f8p4Hu0tXt7gCiYxbvNWt0lL
 pg2DD0W4c7E2hCnsPD98KfcySEA88SvL0w7izCAiJU8elDvM567E+/2DurtmUAAYEnQa4jrH4ve
 NnfiF1EpXOneF7ynQ7p
X-Gm-Gg: ASbGncsL/lHqBRHY23RfRExSGgwlnlx6uKa5jjUzB8orFnu411z/Bmqwm4BYy3HHNLI
 9O/vda3HEqujm4qL7u08hFwIFVqdeDeYiUL0m0vypf/W15gJGFhyQX5sfrNa7BXMtvRNddmltXi
 5MhMOdtorLjItFoTzoC14hbX0tyLAlbmbsAinJff9/qC6uLtoB28cCvc7D+GwIyxYiQE+USF9Fs
 z/FxFIT480WDiC5C6oQ696AtxXR8eQpvjBct6+UNopt6tkkGb4Zz9bPZ8yQYtZKyaL1APADKYY2
 K8hOhJl8HLn/0OJ+Gek7M1Oed4WTwhoLqMNSyj/j2wjCCqBPDDYjesp+1D2g/hYv9Yt9m6CLamL
 TsykUTCoohynwaGa87g8JZ4R9Er2Mcfry3k6zNGAklPeMIp1wee6iC8WAvYC4SP0jecvlUfO4
X-Google-Smtp-Source: AGHT+IH4KGq5I96OKnsFTDhAnXqgBmFt6CEk1+Jxh6CEbB2ghnnIRD1YycLSc0RNgvxEmNvnVA4Ls8+uJBMf
X-Received: by 2002:a05:6e02:168e:b0:425:73c6:9041 with SMTP id
 e9e14a558f8ab-42f873d1182mr130846185ab.17.1760118715752; 
 Fri, 10 Oct 2025 10:51:55 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
 by smtp-relay.gmail.com with ESMTPS id
 e9e14a558f8ab-42f9031307esm3964265ab.17.2025.10.10.10.51.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Oct 2025 10:51:55 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-369b2d355d0so14260441fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 10:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1760118714; x=1760723514;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0OPb16XAxCxkWaCKR+sCUkPkjLd22eeuyEg2QTbZKaY=;
 b=avIvgwUQ3KN3Cuxu/HwNkMAUqdLwEeImwh+FhWHeRWuXrThQvscNtmXmXw8ZQrIuG3
 G+IFhuubvlZdlAseTeUweDFI7AwrQX2zWinIjU88pTToaDKDB9MVGYLg4JuZAtczpgrx
 M3PJq9UvVcnopshz2aDCPGFODv4/lWfnxp6zE=
X-Forwarded-Encrypted: i=1;
 AJvYcCWWNgZYKTI1+Zo47QICu3t+qesTclGJskgmv+LvFREcfhOVlkh6SuD7SuPNg23C4vK3WxLTgHaP+94=@lists.freedesktop.org
X-Received: by 2002:a05:651c:25d2:10b0:376:4320:e362 with SMTP id
 38308e7fff4ca-3764320ea28mr3705001fa.48.1760118713613; 
 Fri, 10 Oct 2025 10:51:53 -0700 (PDT)
X-Received: by 2002:a05:651c:25d2:10b0:376:4320:e362 with SMTP id
 38308e7fff4ca-3764320ea28mr3704941fa.48.1760118713122; Fri, 10 Oct 2025
 10:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20251009200354.2752095-1-zack.rusin@broadcom.com>
 <CAPM=9twGyY03RNHQZvi_AWmKQS8EnyVvT4VxGGSraoN_V89m6Q@mail.gmail.com>
 <ef3d0d88-b24c-448d-8370-2969ad8d7ff2@amd.com>
In-Reply-To: <ef3d0d88-b24c-448d-8370-2969ad8d7ff2@amd.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 10 Oct 2025 13:51:40 -0400
X-Gm-Features: AS18NWC1-ORHh3zozihqTZ0j-pbCPMnM9Mn1wFIdPrBRufp0GrZAGa_ZB7K9BU0
Message-ID: <CABQX2QMpPO4_vOKVuPqHzLiDOAyGMVGtLrCKnygdcxHqQ01ZHw@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: [RFC] Propagate fence errors to userspace
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, Faith Ekstrand <faith@gfxstrand.net>, 
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000b7209f0640d19220"
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

--000000000000b7209f0640d19220
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 4:15=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Ah, yes I've talked about that topic with Michel just last week on XDC.
>
> It would make sense to have a generic interface to query the errors so th=
at the display manager/compositor can do something reasonable when an appli=
cation messes up its rendering.
>
> E.g. display a an error message instead of just a window full of random p=
ixels.

Right, exactly. It'd be nice to have just one interface for all the
drm user-facing apis (DRM core and driver specific) to figure out that
some asynchronous task/job errored out.

> On 09.10.25 22:35, Dave Airlie wrote:
> > Just adding Christian and Faith, who might have some more comments.
> >
> > On Fri, 10 Oct 2025 at 06:04, Zack Rusin <zack.rusin@broadcom.com> wrot=
e:
> >>
> >> Propagate the fence errors from drivers to userspace. Allows userspace=
 to
> >> react to asynchronous errors coming from the drivers.
> >>
> >> One of the trickiest bits of drm syncobj interface is that, unexpected=
ly,
> >> the syncobj doesn't propagate the fence errors on wait. Whenever somet=
hing
> >> goes wrong in an asynchronous task/job that uses drm syncobj to
> >> communicate with the userspace there's no way to convey that issue
> >> with userspace as drm syncobj wait function will only check whether
> >> a fence has been signaled but not whether it has been signaled without
> >> error.
> >>
> >> Instead of assuming that a signaled fence implies success grab the act=
ual
> >> status of the fence and return the first fence error that has been
> >> spotted. Return the first error because all the subsequent errors are
> >> likely to be caused by the initial error in a chain of tasks.
> >>
> >> [RFC]: Some drivers (e.g. Xe) do accept drm syncobj's in the vm_bind
> >> and exec interface, they also call dma_fence_set_error when those
> >> operations asynchronously fail, currently those errors will just be
> >> silently ignored (because they don't propagate), I'm not sure how the
> >> userspace written for those drivers will react to actually receiving
> >> those errors, even if silently dropping those driver errors seems
> >> completely wrong to me.
>
> IIRC during the initial drm_syncobj or timeline bringup we had a brief di=
scussion if we should do this on wait and then decided against it.
>
> The wait functionality in both sync_file as well as DMA-buf file descript=
or doesn't bubble up the error on wait either.
>
> Instead the sync_file has an SYNC_IOC_FILE_INFO IOCTL to query the result=
 of the operation separately after the wait is completed.
>
> Amdgpu, Nouveau and i915 have functions to do this in a driver specific w=
ays.

What's the mechanism in amdgpu for getting the errors back from fences?

The thing I'm trying to reason about is "assuming a new driver with
new userspace what would be the friendliest interface to communicate
those errors". In general I thought that accepting
syncobj/syncobj_timeline as arguments to vm_bind and exec ioctl and
signaling them would make the most sense, but only if we can
reasonably get asynchronous errors from waits on those things.

> I think we should just add an DRM_IOCTL_SYNCOBJ_ERRNO IOCTL (feel free to=
 come up with a better name) to query the potential error from a timeline s=
ync point after waiting for it has completed.
>
> One problem could be that fences with errors are garbage collected on a t=
imeline before we have a chance to return the error code to userspace, but =
in this case I think we can just propagate the error through the timeline.

So cache the first fence error that was spotted during the wait and
return that? Would it reset the error on the ioctl or would it reset
on the next wait? That could definitely work. So assuming that maybe
instead of DRM_IOCTL_SYNCOBJ_ERRNO we'd call it
DRM_IOCTL_SYNCOBJ_STATUS the procedure would be:
long timeout =3D drm_syncobj_wait(...);
if (timeout < 0)
   // wait error
int status =3D drm_syncobj_status(...);
if (status < 0)
  // at least one of the fences associated with the syncobj failed
Would that make sense?

z

--000000000000b7209f0640d19220
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEINkZ
UylY6WzEB/0HEwblh+PcUvsGcc2RTR1HJHrYK95nMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MTAxMDE3NTE1NFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBACsJFQXtpFItfxtuM8qnNwF2ENz32mqCTnIcyl/c
fyxyvRuBKEUsxxWb2C3b/jVlZ24mQivr5N50z94DMJkGKGu2C+HrXdpGLne9SqgGUUJOgmX4nhKQ
cm/w+dIqSxjLxATTgFV7fti2I3HGT1dRGf81KZy2DXXcFf/FuVl3CbzX1y8D75OUYwcDXXYNAeh9
10MGupvs4+b584f5JAvGyZ+4gXrYCc9nW/t8MyIcheWhhJehnxgvF2wAYjPdIJ6sc4f3CluzKZIS
KV/VzuMK3j7wRW4m/YaRzESXVbuHPEouSGOKZ/QwS1M+dBla1zaDv8Zq/oQ5oZgfNUxlwfkU/bg=
--000000000000b7209f0640d19220--
