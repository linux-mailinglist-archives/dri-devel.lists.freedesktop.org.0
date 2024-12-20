Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76679F943B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 15:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CEA10E397;
	Fri, 20 Dec 2024 14:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U1YqOaww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138EC10E38C;
 Fri, 20 Dec 2024 14:25:38 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d3d69e5b63so284571a12.1; 
 Fri, 20 Dec 2024 06:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734704736; x=1735309536; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oW8Yx4GvJ17pe4zJBq56RpWHLJJBmzwKnHD3q58YDlY=;
 b=U1YqOawwbosz1Ymufh+pHUrWGixhm8Es6JEM2/8TSJ3/gZ6zlze6yGJg8YzTtYQLaP
 p5Wxxpb/z72HcW0Q8jhLuui/NQhMHMUBx697xC+nrT1aEbarU1EsaSUdGLvnBFpay/qu
 NYOBdeJzA8qK5JWR5s6m3nqcmKd5Yb1p4cI4TGjfVpzjQFHNmVPkjghuuS1MRtG+gos3
 VXAJ1sqReMkSHRWBSgDan11XhACmpF/fmH+RmioJ3l5fKwDtmB2m4HQiI8HdhMlHgm1+
 kjxsD41QF4/RVaMhO4jr/sJBy3p4oDvxBRQ1+2cU9ffM2xLN9d2etcfUE17hMWcYVBtZ
 5iVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734704736; x=1735309536;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oW8Yx4GvJ17pe4zJBq56RpWHLJJBmzwKnHD3q58YDlY=;
 b=cemWorSwWo6bHl28xLHC1qFmSpQbibwsCN+m9LqDsQnnB4xuNxqPJQpaIukWF40RgQ
 jTRFal5hc5KuIb3tWOEENRFAh68da7pmOyfK2KKSB7q9hIevARgWVSId4QVW1Aax9pQO
 hNhI6JRTm0i1SAn0yT0Ki4WQQ56sGYjDXdXedKDvdsCdpox4qaeW15CNHrNuwVXKmul0
 5Rziw9ykX+G8u0HIVMF371EUxzUgWa65msIWR6oUjyENvz7gx5aQSspE3HLvmPjOSgzL
 new/fluZPGMhWnGspLrwmJYwe8gUvU08Sw/CtWiKL2w979Tr4h0/jsAzgvQoh22FK8Up
 t+vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTmd7Ti0uyRp7pSZ+vkKYepQcrEVz75bTJZsPVhaFKl3f8QKrS143KLIpCZGHrUhC7FHRWacnOtJMZ@lists.freedesktop.org,
 AJvYcCWDf06A2LopLukq2spmzI1xr+20H9hgbU/+vsSOdGnLOn+t83MuQcjv+GGFe5webdInwQnh5CE9@lists.freedesktop.org,
 AJvYcCXSRbcXlmATW49lfuhLTplml+uFFF5iNXOem7xF9QnkJHT/GZT/B2YyNJqLnvmCoPZQrcZuwZX2W4s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwjIxrl6yHMi91+NVgvAHKX7Mx3b+8Pr7CllEv2o3i4myLCsZ7
 xdbV1I2SmAcNcLpf1gbTpw8jKrN/kz+uz3kpmPsxj8i4eTVjIaSa2bTGChZHPlvaFelNlyU6vxp
 a8PYpMjg406CugcNITvGdt7n1ymlCFQ==
X-Gm-Gg: ASbGnctV0hVRtdKgf/dJ8S7pWeyjYsdVXpQhcyPU0QhA0+O2fl548QTHmjSzMVlRCYF
 3AItSB03ENjRwMpucBS1xgvjWOmSPDsphDglVuvvi
X-Google-Smtp-Source: AGHT+IH/lcPM376/rfg8KhebaerOuj8LAx1NxEwjVXaCO8RYHN8NRR6/5SK3Cb3QuG/yCBy8EQPDoo8IC6zqeUmm6V8=
X-Received: by 2002:a05:6402:5246:b0:5d2:d72a:7803 with SMTP id
 4fb4d7f45d1cf-5d81dd83c73mr1047222a12.4.1734704736234; Fri, 20 Dec 2024
 06:25:36 -0800 (PST)
MIME-Version: 1.0
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAAxE2A5+=QVAFXXCbe3qEgY-Mzb-5XW73CYdANEO+N_xA+ivaw@mail.gmail.com>
 <zfjnuz2pfg7j2g2zrbt5ryde223plzr4rdyk4f4ans5znicw3l@kbebotesmobf>
 <CAAxE2A6u4Ee=yBJHo9uKr0Be8Ta3MwSxvt79GcbF8D0R952_FQ@mail.gmail.com>
 <nlcq3xjef3mapwumuelnspinmgucersb5gazk2p7yxqv5aops7@t3p2e4sze75b>
In-Reply-To: <nlcq3xjef3mapwumuelnspinmgucersb5gazk2p7yxqv5aops7@t3p2e4sze75b>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Fri, 20 Dec 2024 09:24:59 -0500
Message-ID: <CAAxE2A77DVSWM0vOZcBSmM+1sbt2kOdCC7SRDMRpeBPsW_J2Vg@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: Brian Starkey <brian.starkey@arm.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
Content-Type: multipart/alternative; boundary="00000000000097f93e0629b46bf4"
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

--00000000000097f93e0629b46bf4
Content-Type: text/plain; charset="UTF-8"

>
>  * Modifiers must uniquely encode buffer layout. In other words, a buffer
> must
>  * match only a single modifier.
>

That sentence is misleading and impossible to meet. Specifications are
sometimes changed to reflect the overwhelming reality. Multiple modifiers
can represent identical layouts - they already do between vendors, between
generations of the same vendor, and accidentally even between chips of the
same generation. Modifiers have already become 64-bit structures of
bitfields with currently 2^16 possible modifiers for some vendors, and
possibly exceeding 100k for all vendors combined. Encoding all linear
constraints into the 64 bits is one option. It needs more thought, but
encoding at least some constraints in the modifier is not totally off the
table.

The semi-functional LINEAR modifier needs to go. The idea of modifiers is
that nobody should have to expose one that is unsupported to keep things
working for a subset of apps. If the LINEAR modifier is a requirement
everywhere because of apps, and even drivers that can't support it must
expose it, that's a problem. It causes GBM/EGL to fail to import a DMABUF
for a random reason and it can't be prevented without, say, looking at PCI
IDs. If that happened for any other API, it would be considered unusable.
We can either fix it (by replacing/deprecating/removing LINEAR) or abandon
modifiers and replace them with something that works.

Marek

--00000000000097f93e0629b46bf4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0* Modifiers must=
 uniquely encode buffer layout. In other words, a buffer must<br>
=C2=A0* match only a single modifier.<br></blockquote><div><br></div>That s=
entence is misleading and impossible to meet. Specifications are sometimes =
changed to reflect the overwhelming reality. Multiple modifiers can represe=
nt identical layouts - they already do between vendors, between generations=
 of the same vendor, and accidentally even between chips of the same genera=
tion. Modifiers have already become 64-bit structures of bitfields with cur=
rently 2^16 possible modifiers for some vendors, and possibly exceeding 100=
k for all vendors combined. Encoding all linear constraints into the 64 bit=
s is one option. It needs more thought, but encoding at least some constrai=
nts in the modifier is not totally off the table.</div><div class=3D"gmail_=
quote"><br></div><div class=3D"gmail_quote">The semi-functional LINEAR modi=
fier needs to go. The idea of modifiers is that nobody should have to expos=
e one that is unsupported to keep things working for a subset of apps. If t=
he LINEAR modifier is a requirement everywhere because of apps, and even dr=
ivers that can&#39;t support it must expose it, that&#39;s a problem. It ca=
uses GBM/EGL to fail to import a DMABUF for a random reason and it can&#39;=
t be prevented without, say, looking at PCI IDs. If that happened for any o=
ther API, it would be considered unusable. We can either fix it (by replaci=
ng/deprecating/removing LINEAR) or abandon modifiers and replace them with =
something that works.<br></div><div class=3D"gmail_quote"><br></div><div cl=
ass=3D"gmail_quote">Marek<br></div></div>
</div>
</div>

--00000000000097f93e0629b46bf4--
