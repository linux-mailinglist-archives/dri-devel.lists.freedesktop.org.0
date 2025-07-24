Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7473EB0FE8A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 03:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1126B10E1A9;
	Thu, 24 Jul 2025 01:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="B1RbBah6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7902610E1A9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 01:59:49 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ae0de1c378fso62626366b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 18:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1753322388; x=1753927188;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pv2/YAjQGx18dZmEkcBB7XSK6g1uvGZpGDr9HxLVLZs=;
 b=B1RbBah6aaKC/Uuxh+boPj4ycEF6a6X14/U7MglX5zz2SU95nMogWo08ZnQlMvOylH
 flxoFSLlVZDSl+Bicpgv58gLvmvv3AT+MQi7sywgTFGPcccjgCqzot51+p6bVv35BPhL
 XhTtAL64XonmS9XmGx9EntA9Zswi4gynR1AAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753322388; x=1753927188;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pv2/YAjQGx18dZmEkcBB7XSK6g1uvGZpGDr9HxLVLZs=;
 b=vsypiW2cbF+qaSNfNzcKBPsjxGgdomdjPtopAnSvkzkZ/22YxNOMvsFyn/VT0paQiW
 JM4p8IfGemUBnfJqWgkAm7Kpv5YAAIQBpHiTPczj1H1MWGaLkJ8ESKflV/13QHVAiSXY
 vgKrPf3m9neKDX/FmP1R1EByeYmrIB4RAfCpB+lqxiFRwsBlffcywb+w50vEtQquqEr1
 dpLLlWFtr85g9ezGBlfauz22QWhd1aq/2fozq2Rdj/LKkbANRuKuwlPEeJCERVc8QtGz
 70tLD/kdLKyyZD3bhVAbJCEPxXebPoD3Etf6so17VRSmqgUufr1IT2F7wH4gxLarkXKW
 LJfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2+NVPA1l7oqWK4jjzhMBLIxVG+dMVPTvHK2aKB64wEuEDKAgNogOLVQe18DayFbhfwDE7WCH+Ubg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+p7Y7MDQHQ2++EEhKU/mwLFVQzn3bq+2pSs2Rgzi+/p2QYhvt
 b2N1h+auol7JYZhVQ89coowu831ZMTrT7a84cmxbCEM2VnNpP1Lx4F/fT3DAM1satUj1aMCKNuP
 5IMB6Pdhenw==
X-Gm-Gg: ASbGnctfhh1RuhvCDqcQAJJSGrktH0A2LkuKMbV5RLYxL1ct6b5Yp/lu9nhgP2OwZoO
 dtxc4CtejGxH0oJS76vWt4JTStnC0RxsjirqCG4kJ8C6AAzyGVNehTIPLVT0HHK1mFb8lrbpUZd
 xFpPfw5KfZQSRKM4JizqVc3E2Or6WZqALmJ/Piky3kanqbPDYa5qYyDYK5/hVZtKkNSBsHjaSS6
 +GS3Ry1udrPbDJRGrshRZiZo+q59hQQcmA7XBhptnzHRP9JQrFk+YzykMxlZddEo3V1ceaPCP1K
 OPYQLV33NrTxcSO5mguVW2e3EwGBRSYuiDC4dvKnIk1vDEa+xXum3Ca7KD2CYZPC1glglkFrGuS
 Ui+Qp+xLgCgE1N/RGkDXxdCvun+AqylCk1ZWMfI+9n82ssnW+Qb0f863kYmS3dNNf+sM3PdTF
X-Google-Smtp-Source: AGHT+IEZ5I4kyjOkIC2vUqaI4JL2dX9iZ/sJbIFpxSMEEqybStjaoi1EnNWVBOXchGIS1et7dx4xLQ==
X-Received: by 2002:a17:906:d542:b0:adb:45eb:7d0b with SMTP id
 a640c23a62f3a-af2f6c0ab61mr542051566b.15.1753322387601; 
 Wed, 23 Jul 2025 18:59:47 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af47cd64e7esm37431166b.51.2025.07.23.18.59.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 18:59:46 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-605b9488c28so888559a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 18:59:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUgA7I2jG/hIfrcwS5v2+pkH576ecZzTWTEZQRSm1WzXu9mkaVVu7/JUDOmnMu5PWfogHLfVtb6CTw=@lists.freedesktop.org
X-Received: by 2002:a05:6402:4404:b0:608:6501:6a1f with SMTP id
 4fb4d7f45d1cf-6149b415545mr4129336a12.1.1753322386209; Wed, 23 Jul 2025
 18:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twUCJj4X-2jf0VG5+A2YN9Gk8hjOAhJ2hxq4SdgZfvtMA@mail.gmail.com>
In-Reply-To: <CAPM=9twUCJj4X-2jf0VG5+A2YN9Gk8hjOAhJ2hxq4SdgZfvtMA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Jul 2025 18:59:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgLQ+EPeV+JzrvkPWt2jeteqwsRkf-X61jjfV8pefgXeg@mail.gmail.com>
X-Gm-Features: Ac12FXyCiDBFkm6GlVYN3UTcVigsgGQehFrUCzri7NOS0-ukmGslf3n2m6dCQDc
Message-ID: <CAHk-=wgLQ+EPeV+JzrvkPWt2jeteqwsRkf-X61jjfV8pefgXeg@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.16-rc8/final (resend in txt for sure)
To: Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Wed, 23 Jul 2025 at 17:40, Dave Airlie <airlied@gmail.com> wrote:
>
> (this time for sure, plain text).

I knew you could do it! Third time's the charm!

I hope I don't need to worry about the branch contents as much as I
apparently need to worry about your email sending capabilities?

            Linus
