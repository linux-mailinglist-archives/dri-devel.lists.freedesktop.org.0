Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DD64D5D4F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 09:30:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E51010E3A6;
	Fri, 11 Mar 2022 08:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E3110E3A1;
 Fri, 11 Mar 2022 08:30:40 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id e6so7177898lfc.1;
 Fri, 11 Mar 2022 00:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=4A4vQYXWKMboDmY71zzkIVtZ8zksQHXawavPjSCCcss=;
 b=R8Hgo3UCTgjRg8KYjWJnt4m5CiReYvnEzCKPTfAYLpjg/Ztb9IH4sHONTJFpyzqFTg
 sJW3GbuG8H0HbGpclbJOCrGOWaAnfuLW2lASX/or9DtsawfzT3wFzqGwTGI6G76sfzJX
 7k4+YAWCWDUnnBnJx8977e3FH9Xq9aNG+03X8/wFA/ViF5Cyk4IadbgsHUs/mYlse0rl
 ekj3NPbtWaO+Oftm2l0kVYyV0W7V6zdR+LcKzWFIdCI1RD9YUvf4wI7GvSkK8RP4iDcg
 dUKjjgEK5NawJ2AIKDJHo/vawHXuW33RRTh836HR7fGBl0AU71WIm1hM4b4HBWU8XGMi
 EJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=4A4vQYXWKMboDmY71zzkIVtZ8zksQHXawavPjSCCcss=;
 b=7dkvUFGezFgPLqujyjJ2e1DOy42bxvp2vJwGO/2bUeoj5eUJFxA2umTJosIym6UamZ
 n+ZObCI7ogjyBeGpsnM+LflFPiU8DJdUmaCWKFIiPFiz/wSMCtmEnx/AmSaGdiTwVEwc
 +WpRY9Z4IiIXHtmzUqEz2OCT1K81d2jFi2vKXNUFW+5MLeBTGIr7WOop2kMUv5/Z7+dx
 +ulmX6SeEBd/FDzrfLaiJCdCHJl96jxACyiEC2ciVaM+3r9Mv6061HcPmruz4YpO1N0T
 4J6sh0LY+Pc0iufyYxVNCHZRqMzMctsdC/d2xp84VGyRDJ04nsQqkriDdfzWHc8IsTg2
 pXwg==
X-Gm-Message-State: AOAM531lQ+2j/4h2En/NxGcRZvZHoLEnU3VllvI1jTBY0dFtBZraN+kL
 YhvrHmb2caKQLNLtoTm6RM8=
X-Google-Smtp-Source: ABdhPJyAmR1kNeGsOAacaglZmhtiwBasj/FTj6zPaavAWidFuwTTTExOkNBLY4mqH28KH5AqVEcdqw==
X-Received: by 2002:a05:6512:1698:b0:445:bc1d:3835 with SMTP id
 bu24-20020a056512169800b00445bc1d3835mr5266286lfb.122.1646987438481; 
 Fri, 11 Mar 2022 00:30:38 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 h5-20020a197005000000b00448287d1275sm1470496lfc.298.2022.03.11.00.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 00:30:38 -0800 (PST)
Date: Fri, 11 Mar 2022 10:30:28 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Shashank Sharma
 <contactshashanksharma@gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Message-ID: <20220311102709.225616cf@eldfell>
In-Reply-To: <CAF6AEGv3Wv+p1j2B-t22eeK+8rx-qrQHCGoXeV1-XPYp2Om7zg@mail.gmail.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
 <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
 <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
 <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
 <CAF6AEGvvskobh6YOUx55_4rtXJJjPO0PxWY8+EKiVqntT3k+ug@mail.gmail.com>
 <6b400b8b-1b5c-a339-2345-f317f197b4a6@amd.com>
 <CAF6AEGt0XhqzkyEhbNcNVQO_A_Lo4qcsPRZRL6QqYn+NWAfv9A@mail.gmail.com>
 <bf6922f0-da8e-eef6-8217-26c1f50f3c48@quicinc.com>
 <2980e6a0-624e-2b80-c5d0-c40dfce76fb8@amd.com>
 <CAF6AEGvC=k4xLA-0iTSf660X2o04E+ivjnThZA-=WANKzLSvpA@mail.gmail.com>
 <cda15a47-f469-2a7e-87b6-adf00e631ef0@amd.com>
 <CAF6AEGv3Wv+p1j2B-t22eeK+8rx-qrQHCGoXeV1-XPYp2Om7zg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UmZwduGjo1nGq.M4732LB4f";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/UmZwduGjo1nGq.M4732LB4f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Mar 2022 11:56:41 -0800
Rob Clark <robdclark@gmail.com> wrote:

> For something like just notifying a compositor that a gpu crash
> happened, perhaps drm_event is more suitable.  See
> virtio_gpu_fence_event_create() for an example of adding new event
> types.  Although maybe you want it to be an event which is not device
> specific.  This isn't so much of a debugging use-case as simply
> notification.

Hi,

for this particular use case, are we now talking about the display
device (KMS) crashing or the rendering device (OpenGL/Vulkan) crashing?

If the former, I wasn't aware that display device crashes are a thing.
How should a userspace display server react to those?

If the latter, don't we have EGL extensions or Vulkan API already to
deliver that?

The above would be about device crashes that directly affect the
display server. Is that the use case in mind here, or is it instead
about notifying the display server that some application has caused a
driver/hardware crash? If the latter, how should a display server react
to that? Disconnect the application?

Shashank, what is the actual use case you are developing this for?

I've read all the emails here so far, and I don't recall seeing it
explained.

Btw. somewhat relatedly, there has been work aiming to allow
graceful hot-unplug of DRM devices. There is a kernel doc outlining how
the various APIs should react towards userspace when a DRM device
suddenly disappears. That seems to have some overlap here IMO.

See https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#device-hot-unp=
lug
which also has a couple pointers to EGL and Vulkan APIs.


Thanks,
pq

--Sig_/UmZwduGjo1nGq.M4732LB4f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIrCKQACgkQI1/ltBGq
qqd8mA//cGbppZ2gQS7liFLuWNFG3s7wR4DR427vOC11M/TQdO06TeUg95p3WhXd
nl0ncQUs3du9k+0TZGZftceUQCdId8sANS4leHYnfjjNgMQM8Lizqt3e3l0afvOz
7+DD71sNa5o0hDovN4n7nXXue3abAitkoKdBPJDxYKEGyKAFTtraKntPvIryezJm
HpO5fTNB68Lxa0Rbeuvs77Eo2BanQj8pMZN3we5YOTMf4QFat54oFxodlc9tBqmS
M8nDc8bgDeaD0w0ORmNI1HvSRTsC2Y1A6StQmreVujUBob70Hf4o24DXkPvkoIHd
OK71ozVa7PPX4g5tpiitYQxR47GTUQ6ovADvcs3Oias+YlinnxSod6JwDIaBkOuZ
ihF38DV0rm/SDQh7J1L3SwsGoaehJNsdhmaIVjAZ85k4NIymxCquLuPwspOk1/Ue
Sg9vlXaSw6SMSKyIJ6NHb7tUpNi6jOYWqheBI8btZpzDI6CNPE4Omuumm/63qQn5
XB6V3use+xkiGBeD3g5URMjoktn1SMjLv/X97s7KSNHyk3GI+aDM22vRtSxtL/7g
pzSOg8fNd6/S3jLZmlBL0+sX8mBprIfRWXfhOErQVDdJc7qXGVV8bo34K76oCic6
yjCOHQ7w58daTJf1k3I7rD3ZMslHCebw5f+2Qp8C2jzlrMxDEPk=
=7uHj
-----END PGP SIGNATURE-----

--Sig_/UmZwduGjo1nGq.M4732LB4f--
