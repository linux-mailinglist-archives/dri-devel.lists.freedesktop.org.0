Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F3EC1BAD2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 16:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E2010E7FC;
	Wed, 29 Oct 2025 15:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="MtWsMBqt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f228.google.com (mail-qt1-f228.google.com
 [209.85.160.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B0110E7FC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:32:25 +0000 (UTC)
Received: by mail-qt1-f228.google.com with SMTP id
 d75a77b69052e-4ed0d6d3144so20180071cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761751944; x=1762356744;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5gL5umqkvm/cBNOZYBblytBaSpMMFc0IShsclBWBxA4=;
 b=JBvegL4agawRy+O5cMDApYdsqBTBbbgi2+T0eM4WZ/fsubjQ51xaM4dmHtrUCrjs3f
 7hAu6JpECPr4mk+3dfsBGl1/8j2l9Gh5jcvMVzX0cHURe/yhTPiB7as6mTrGV7LjeXMA
 22vyMVkKXDs3xtONResF7GK/7CZY7xrER3sFcF2lQsqXwz+7z04Ss7q3UhSv2XLE4fN2
 AAF/2R4NR+aL84PbsuKzoIFnlFW8MFmqutfFqLVf6xodz1Cn/pq35uJP8nVb/ChzkK70
 hFgIABElbEiLgK9J9s2R6O6ZQ9g0UchqjrDR2HtxuiNCAIqBGhK/b7kdYSAunlgi66sb
 Qulg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTqYeo9EmxSYu85KSDkWhfB7rtma4BUoGZaNyNm5zdOlJwpRDPC2zVa4La3nDfGVkN+ahPIm4VWNA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw49F9EwAQSAvyvhzNGwvNBW0OoEQH6SgLYij0THtZnItTdAP7Q
 YjWeuNtUNxf5DIEh5kMvzY4H5z4Or5VAsqunj7h0g28tQxPhTtGLxknaQbw+V2KJNB3HxKJv2ZY
 r5cHOwdOr/CIclzelOBIRk08GQFKIA3RsdIp9MfFg9sB4iDWnkMWBXdLdPXzoZOFVEBTmgoq6eU
 smw8ZYH6wN0UsiFJTfzlnnEsIRS3cB92yeDqfHi9fYiCtHSHJMNZa7l9KXVEMTSMe0CuAGNFjXh
 oJUBp34pF16i1fYLHym
X-Gm-Gg: ASbGncukP4B7lJhJzRmQ7DfCbRuo7tS+W2nVEr1whfPMNb0StXCC7BItrbFjVKF8mnI
 utrWqWVjjNRg2B4bY/BINGcE6Y8UpbAZrXHUXRgMH3rlLqx8zbT7gOFsyM4X9wHghcW9zdRTuNv
 G/BS25bLPzQGCOCXr3+POFl0SVDF/jcak8wGJuKhEUENqqe+KRtPKpSxWDK6KrVBOQTDs1xsZWI
 fp4291slPDiBwmOFgmvQkR3DedRAYxS2PPaBvH4kr+pmxQdB1qbKbNnJeAZOsD7YqoBW/9/iZS7
 W5Cpc1YCzp9QVA02PC//csxSQQPI4PY7yOYPnD4s1wmLIuoHJjGeVXSDndNxSmcg6Lkye1RV4t+
 3r8r75OsW67l9SC5WcyNn3xMMFaicvO1wYb0OvqNrUkVm24XC7dzMg0zUyLwEOpBfO2P+X09Cxq
 ssLgA5bbf3ZiTRofptdQPFwiqBrWhgnOsFXg==
X-Google-Smtp-Source: AGHT+IHU7HgI2MmCOR41xylceDSg24nKmVBq393m/kw11PuxyaJIE4vPhvArpGiLxb107T8bs3v+zOD67syx
X-Received: by 2002:a05:622a:14d:b0:4e8:a3aa:7a89 with SMTP id
 d75a77b69052e-4ed15c7ad4amr40208181cf.45.1761751943953; 
 Wed, 29 Oct 2025 08:32:23 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
 by smtp-relay.gmail.com with ESMTPS id
 d75a77b69052e-4ed1cb3a33esm401891cf.11.2025.10.29.08.32.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Oct 2025 08:32:23 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-57986226b53so3967636e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1761751942; x=1762356742;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5gL5umqkvm/cBNOZYBblytBaSpMMFc0IShsclBWBxA4=;
 b=MtWsMBqtCKmJEnbRQKbFcbpdfWE1aKibjjlkv9pOePKrDSO4592UYU7fYykP0fub4T
 aRr4m8A0gdW3e1QeZ0PcUe544a6JQf4RK6wUqrz1MIOlPD/BluEFqTMyLB7R2W1kAjmD
 yU0pdOuGYyibb4SvwSmMvZlrrmDrxL2z3DbvE=
X-Forwarded-Encrypted: i=1;
 AJvYcCXxFTvLBRGQFePRAsU+VAwpP4Mko1d2lM0yXqXXqMRxpqFEuHCCJBtVVpNB4qLOvg2ZDt/BUIixWHE=@lists.freedesktop.org
X-Received: by 2002:a05:6512:b08:b0:57d:4904:d90c with SMTP id
 2adb3069b0e04-594128b58f0mr1200997e87.15.1761751942089; 
 Wed, 29 Oct 2025 08:32:22 -0700 (PDT)
X-Received: by 2002:a05:6512:b08:b0:57d:4904:d90c with SMTP id
 2adb3069b0e04-594128b58f0mr1200980e87.15.1761751941554; Wed, 29 Oct 2025
 08:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250928054913.7871-1-opensource206@gmail.com>
 <CABQX2QMgZ0VGQ+-RhF0suTyL9qkU1Hf5V7g2jvPQ+CwTEidZKQ@mail.gmail.com>
 <CAKPKb8_tHVEFrkWHF3ycuDXOCJ9-qr64_sii9O4bcUiu4uuvRQ@mail.gmail.com>
In-Reply-To: <CAKPKb8_tHVEFrkWHF3ycuDXOCJ9-qr64_sii9O4bcUiu4uuvRQ@mail.gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 29 Oct 2025 11:32:08 -0400
X-Gm-Features: AWmQ_bkfYTnoBSNYgMHN8oNH8kzWz5Fa9UwbzGdFeWzdbjOHWVvpP13R9VC5bm4
Message-ID: <CABQX2QMPJSV8-J+_A1aj+DbgQBbEXASq407-g+Q771+gsgZEDQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Replace schedule() with schedule_hrtimeout()
 in fallback wait
To: opensource india <opensource206@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, bcm-kernel-feedback-list@broadcom.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000b7cc2106424dd6d1"
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

--000000000000b7cc2106424dd6d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 7:06=E2=80=AFAM opensource india
<opensource206@gmail.com> wrote:
>
> Hi Zack Rusin,
>
> On Mon, Oct 20, 2025 at 9:48=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.c=
om> wrote:
> >
>
> > I don't remember exactly the schedule family of functions but isn't
> > schedule_hrtimeout leaving the task in a running state? In general it
> > looks like with the patch the task's current state doesn't match what
> > was expected, plus I'm not sure if I quite get why the uninterruptible
> > non-lazy case is being replaced with a lazy wait of NSEC_PER_MSEC's.
> > It'd be great if you could explain a little bit better what you're
> > doing here because the commit message is missing an explanation for
> > either of those.
> >
> > z
>
> Thank you for checking the patch.
>
> The existing code does not specify any fixed wait time during the
> fence wait. It simply invokes schedule(),
> which means the task can be rescheduled immediately to check the fence
> status again.
>
> By using the high-resolution timer family of functions, we can specify
> an explicit sleep duration.
> In this patch, the sleep time is set to 1 ms, ensuring that the fence
> status is checked at fixed 1 ms intervals.
>
> This approach allows the CPU to be released to other tasks for a
> deterministic period,
> thereby reducing unnecessary CPU wakeups while maintaining timely
> fence checks(FIXME expected the same).

Sorry, but that doesn't answer any of my questions. I can see what the
patch is doing, but I'd love to know why. Same with the wait period:
why have you picked 1ms? To me that seems like introducing a huge
latency into fence waits, so I'd expect to see numbers that back it
up. What benchmarks have you run that show the CPU utilization and
FPS/score both before and after this patch that would justify that
wait period?

z

--000000000000b7cc2106424dd6d1
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
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIIk7
Ro2O4pTTOhB7Vc4dbvL9OrQiAf4I2o0iAnjq/T5SMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MTAyOTE1MzIyMlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAFoKqu8KtGhIADQXeYnUnJel6+qG7pccLQUNIBq8
DW6fRAON0cSV9gK/LVTmhfMsilIZnhl8NZ3W87/7k+DVB7ahvQo/9UcvNAr6aGrSncxzXlxgn2UK
gtIO1H81Odu2hYD6+CbD4HYKUgG5i7jdcMcGQURQCP5r5Ona3tWW9evZmt2tandHn/nuahttSScg
SC7mGAdiu5wjbCvy3zDL9IqKJlRAIRLDoLSTdtrm9Q+uSn4S4StQYJK5v/tH2CS7CwwL1MBZA+CS
34LZXtpFs2MjpWR7xXQSqPlZCU6xT1+mTsLxihi7Sv5QXCeJG5gzPt4+Y+BSbsJ+B0No26nFxvA=
--000000000000b7cc2106424dd6d1--
