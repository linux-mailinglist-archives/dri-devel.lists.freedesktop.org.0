Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFFBA9DBDA
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 17:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B02C10E05F;
	Sat, 26 Apr 2025 15:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Rz2INdc3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A2310E05F
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 15:34:02 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5f6fb95f431so3603509a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 08:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1745681640; x=1746286440;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HbfGRFY1ORn8OxsWarlewNbSwUtGm4LLMqrZX4kLbSs=;
 b=Rz2INdc3vxQls+jFKzPPg30Ec+ttK91BolUmDh9c40ScF8d7IgXiigv0594NwkBxaf
 8eUo9cZ5iVsctV4QAO/u49H6pNkw+NhL+roofIW4GcSCl0aaH2RcRDGUaHCUdKpx4lh/
 5OyVIoG/rlNhl2cSXYw7STxbK6fKt4Un3kR28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745681640; x=1746286440;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HbfGRFY1ORn8OxsWarlewNbSwUtGm4LLMqrZX4kLbSs=;
 b=cWSfrh5TwL3rjPusWaP6/2pyFeZ5mEeGZJ6sZvji4/8NAFm03f4FXp5rbOlW1OhV1g
 dbo1K5iAdhGubQKxVU03OFTVY1HHWzuVzMOU10GGCom1J/UKrKljYbCuMBQ7ENQ4ZSOD
 nGiovm+zPHD1Sra9EpDCXwbOAuBpuzjob3nT5Jd3FOvJNh+APsugSngXTDvzq832l6s/
 iC1+OtNbYlUsi3LKIK1J32UE8A2RzG8yNY/DgsDM6sguxDBXQQxFatSekHI4iQxXD0xi
 LQOaypfspJoX+Evq+q0I1sbqTJpq9DkavGtkOFEBgwp9bkWzfXqtSqlrLCmpUaiJv+6r
 6tEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIU7nfO6fTf/B8hCRdwof/y2tvBvbJKpGfOXo44kgkXp1ApQLEze0FcUDLznSCD69/gHcDGqWrua4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZuRtsKzVrGsDsLKFtVGc8J4U0TlrtBg3RYC4cQjuURh9jeuak
 trmCy/pfmLeuZV2daGTACEgIfPEHzBvoX+krX567iTFaBkI5MZS0dB6rDnwY3Yeb7IElE/lHpQ8
 AScI=
X-Gm-Gg: ASbGncuNex8JR3BKaRBm5jxj+4qQ0omxNilVHWHgbKp2zXy2o1cXIGaGkBzw79E9tSM
 NHD40mLxPKO+dGa7h5FR1l+swrWT6eAxhqaQ0xRCTJqXkuw/JE8kzeFjSlC4soAvk11krsrhQkQ
 8q5ujit3p8ZARG8w3mXRpHjErBwFUVlvGuBDWkJVGMvAfUac8JgNKbkW0SE5AWR05CyDoSWHPUI
 vLCg5yJTBLSsdjKtd0JGRwwaMO+azD2K2i7NTh43zyc9yozJaXmSnd0COHy4RCJdsk0RSMmCFMi
 y72n7rvuX2QMx0wTihqALaS23RoUwdjpVYHeTDwp1H6Ya7pC19BJw8/IxHpytGs9neTSxW11VZo
 Bekd5Hjh2tkuJTcg=
X-Google-Smtp-Source: AGHT+IHGmEVQYsdVp7WnIuesCwiCUb19l6oGHj5HSEVmNUx5TNYqm4Fff27Rt6S8T6GVfC2ies/ZvA==
X-Received: by 2002:a17:907:72d0:b0:ac7:e4b5:4827 with SMTP id
 a640c23a62f3a-ace5a484e6dmr857179866b.28.1745681640422; 
 Sat, 26 Apr 2025 08:34:00 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com.
 [209.85.218.49]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e41c898sm302318866b.7.2025.04.26.08.33.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Apr 2025 08:33:59 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-acacb8743a7so542124766b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 08:33:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVU7UpFCL4mdz+rt6NcvfwmyfiSXSMlOsyJUsV7K5brs5mpLE5mWXf19o2L6BqtgSmx6YbJribrXOU=@lists.freedesktop.org
X-Received: by 2002:a17:906:ef09:b0:aca:c67d:eac0 with SMTP id
 a640c23a62f3a-ace59dfdf18mr954992566b.0.1745681639385; Sat, 26 Apr 2025
 08:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twNOWYCQ6vXZqUAu8G=oxGrKUvcTYz-SL6Jc=4+8ivVew@mail.gmail.com>
 <CAHk-=wj+h6i94DyxGQ2Ez6tvp2sBs70EfY7Lp0N1umpwHL_VrQ@mail.gmail.com>
 <CAPM=9tx2XsDNFDWkxndpFPNihgf18CK7Ps85vE4ZRvuLBG35UA@mail.gmail.com>
 <CAPM=9tzh5sdpfDXQgLymXKn2_qf7ccN4EsAEaYTNEY=hWNbGNw@mail.gmail.com>
In-Reply-To: <CAPM=9tzh5sdpfDXQgLymXKn2_qf7ccN4EsAEaYTNEY=hWNbGNw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 08:33:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=whMccpCwD2q2EADXwOUSzHspuAn-hkvNYKAQLnAcZmeoQ@mail.gmail.com>
X-Gm-Features: ATxdqUFbBNCkGjEM_ki0jdb3CgQwcJU2i7U6M0VeEhqz-zXX5qfY8nimjN_etBA
Message-ID: <CAHk-=whMccpCwD2q2EADXwOUSzHspuAn-hkvNYKAQLnAcZmeoQ@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.15-rc4
To: Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>, bentiss@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 25 Apr 2025 at 23:54, Dave Airlie <airlied@gmail.com> wrote:
>
> It seems to have recovered now, but not sure how stable is it, please
> repull the original PR when you get a chance.

Yup, all good now. Thanks,

               Linus
