Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E02455F8F7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 09:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F7E10EA01;
	Wed, 29 Jun 2022 07:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1C110E1C5;
 Wed, 29 Jun 2022 03:24:05 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 g20-20020a17090a579400b001ed52939d72so9240241pji.4; 
 Tue, 28 Jun 2022 20:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Fj7BbdljqsoGparCST0EyCcPUKNtLNBlk+LCRCpdJLw=;
 b=oFx79pTDKe/0K4DzWTg5WbhaY9GMAgsDaFSkH6r1vPW1HFdOJXqGQ5UZxgywHDM3Ir
 0equTGt8PyPlERIlnTf5/BcxXxzGITpucSE2VIl8CV1o9ehzFCMhzuOGmi45/AK6qG76
 /8w9TpCEjcwZrf18xju/rDZxtqGU8P6zQ25P+y1i5vCqEbFPPa98WvDxnH8cFtX3sIwJ
 junUVkx5AYbgAFw0eC61vARiqpw1IzYsntMTivQEIBdgIUJa+1mBXf7au2lMkxwOomRF
 Tq177jWJbMD53EgF/Vw9Bn+IKNlGCEHOCstQTlq+u9cuVkwNV5MjGVV2oNYBWWI67o+0
 Kprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fj7BbdljqsoGparCST0EyCcPUKNtLNBlk+LCRCpdJLw=;
 b=KVXKmHXbmP9esEIrDNN5Dv7KNRBCzBWhI3cM8ZX9uisMuRPC/DyEqwK2afDYqfZAKx
 fmLliHa+1HSxZGMK4z2BiJbRHe38VQRCNstTR8u7Q/jyKOTImzZJonfKAu2h5enPpzOp
 6uqkSHNU/4Vz9AoMIqBEtVG2zNdP++LuqgPlUzwRa8Wl0K9gHDp+IoZRPomwtTSgdkY+
 zq4czzgS8+NWcMqVYICqaMSpXd9lBG6rlsxPI4gPmqOgqkF41FtKoPJP7zHK+4xUpPJq
 3fqlfTPjeaVaBOAzpbqlmPiQVT6oYRpAmexhdw8T3Q3RvI2t0Ja3OZZmYuBFqnrQpxfS
 yviw==
X-Gm-Message-State: AJIora/ORRPm6Gi2toAhGVIKmXEkhm/wjyJVhoa93SVRZKR9mfr9XaLX
 gF83W3e06QEmAIwqH2hIg1U=
X-Google-Smtp-Source: AGRyM1vsi7CgNn+hm6JA8nRBvn1UfsHiN+DuVQjG+D41n++oNdHScStsgrICm72S8/mDUKvSMDDq4A==
X-Received: by 2002:a17:902:a701:b0:16a:65b:f9f1 with SMTP id
 w1-20020a170902a70100b0016a065bf9f1mr8387462plq.73.1656473045455; 
 Tue, 28 Jun 2022 20:24:05 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-13.three.co.id. [180.214.232.13])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a1709026b8900b0016372486febsm10011584plk.297.2022.06.28.20.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 20:24:04 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id E4C29103832; Wed, 29 Jun 2022 10:23:59 +0700 (WIB)
Date: Wed, 29 Jun 2022 10:23:58 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 00/22] Fix kernel-doc warnings at linux-next
Message-ID: <YrvFzoH61feRFoxV@debian.me>
References: <cover.1656409369.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1656409369.git.mchehab@kernel.org>
X-Mailman-Approved-At: Wed, 29 Jun 2022 07:31:06 +0000
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-cachefs@redhat.com,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, Alexander Potapenko <glider@google.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, "H. Peter Anvin" <hpa@zytor.com>,
 kasan-dev@googlegroups.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Chanwoo Choi <cw00.choi@samsung.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, linux-pm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Johannes Berg <johannes@sipsolutions.net>, Dmitry Vyukov <dvyukov@google.com>,
 linux-sgx@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 10:46:04AM +0100, Mauro Carvalho Chehab wrote:
> As we're currently discussing about making kernel-doc issues fatal when
> CONFIG_WERROR is enable, let's fix all 60 kernel-doc warnings 
> inside linux-next:
> 

To be fair, besides triggering error on kernel-doc warnings, Sphinx
warnings should also be errors on CONFIG_WERROR.

-- 
An old man doll... just what I always wanted! - Clara
