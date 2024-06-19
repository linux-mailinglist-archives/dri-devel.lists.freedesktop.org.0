Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E236690E2ED
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 07:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC5710E833;
	Wed, 19 Jun 2024 05:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CeAUDpSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A6F10E833
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 05:57:50 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42172ab4b60so55084405e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 22:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718776669; x=1719381469; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=scEJE+FtrAipbWWuCOlW7sNdiWYp1YNxGU1Wofz9Sk0=;
 b=CeAUDpShgizt/tS0m/aFsL409TZJVl75v5TbxOTnWhCh502pV096M/aqeqSYJf1ndv
 mOh1t5GLfsFP9xwpjZtK4HwTRLqh5Xnvl2ajQ+XqGUdG48pvjHg1YQhA9M3Vpb1Ur1ZU
 NkwFy4/qKKeiin0yrTSoykHhbp4ifYFbWw1SFKlxY0P2Y+0E8a/j8/h+b742nzc4ScOD
 YRKE9cL15DJN8h2NHFJf/s4ZmWRwTyqqPTI7GoCUsXEdNwmP1IrFfFP0Gp1gqWuI2CTo
 eZEu3fz+C06kRzejrLOfQJFzSE6rjnoRvy+25ESdWK9rAbprzh8lXjOwqdltBzzz4/UA
 qZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718776669; x=1719381469;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=scEJE+FtrAipbWWuCOlW7sNdiWYp1YNxGU1Wofz9Sk0=;
 b=mq34cQEDT/KjcwOu6ZDIDo17Y0nQwdyJwDRt8ZuKwEcK7qbPQ26SLbksdBfVGBgAm+
 SHuPvb2cTXbIyxVmXHekqJhvcFp3dKmFca/x3E3eEWxIXTCv8XmhD3m9s7CvvOxxsT0Q
 J/saMopKPvRarP0tRwGU4noOn3knhcaGsr5h4X0gywzXaN18GAh4+rbTDBiiLXHH5BRW
 SJu3JQV7Z9AwE9AXInTup6LJx5vqBtiZVs+xnPanMofzStn6OvRzjwxX9YRxo2EDfx91
 ETj12pM01pahqRMv6lnkRk60l7z+6GxWy7kue0UWFt+H7iVoobAdv3EW+syy+XPTLPYI
 ZwaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWggrqCfI0fqoJGoNC3PCbGOMN8K/QQs4TB/f/Zue1YhXmO3//kPcCQXpC63kIDz8sVhLU/VscrJ9WYXQ71bKojoTwvRsof6Vn7ZmDsTl74
X-Gm-Message-State: AOJu0Yz2Iaa1UdQKAefWXvNdQtcERec713g9cmrZMOFS0bsRoj+Vr1yz
 xT4y3JJ4AcFBw676ZEwvD4T/4jqQ4KacG3lGe56FphmkBKakQVFs
X-Google-Smtp-Source: AGHT+IGUWmG2ozlLnkr7/lTelYMt1DNSd/pixvzBkdl27mVAYbqX6fLVIuUMu0W+3eqBG/aY2Mqy9w==
X-Received: by 2002:a05:600c:1c98:b0:423:791:f446 with SMTP id
 5b1f17b1804b1-4247507a087mr9346335e9.7.1718776668365; 
 Tue, 18 Jun 2024 22:57:48 -0700 (PDT)
Received: from nsa.fritz.box ([2001:a61:35f9:9001:40df:88bb:5090:7ab6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422874de68asm254670625e9.29.2024.06.18.22.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 22:57:48 -0700 (PDT)
Message-ID: <7b20ed6c17fc7e7a023eb2d305ee699a81a2a2ce.camel@gmail.com>
Subject: Re: [PATCH v11 3/7] iio: core: Add new DMABUF interface infrastructure
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: kernel test robot <lkp@intel.com>, Paul Cercueil <paul@crapouillou.net>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Vinod Koul <vkoul@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Nuno Sa
 <nuno.sa@analog.com>, linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
Date: Wed, 19 Jun 2024 07:57:47 +0200
In-Reply-To: <202406191014.9JAzwRV6-lkp@intel.com>
References: <20240618100302.72886-4-paul@crapouillou.net>
 <202406191014.9JAzwRV6-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
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

On Wed, 2024-06-19 at 11:15 +0800, kernel test robot wrote:
> Hi Paul,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on jic23-iio/togreg]
> [also build test ERROR on vkoul-dmaengine/next linus/master v6.10-rc4 nex=
t-
> 20240618]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:=C2=A0=C2=A0=C2=A0
> https://github.com/intel-lab-lkp/linux/commits/Paul-Cercueil/dmaengine-Ad=
d-API-function-dmaengine_prep_peripheral_dma_vec/20240618-180602
> base:=C2=A0=C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/jic23/i=
io.git=C2=A0togreg
> patch link:=C2=A0=C2=A0=C2=A0
> https://lore.kernel.org/r/20240618100302.72886-4-paul%40crapouillou.net
> patch subject: [PATCH v11 3/7] iio: core: Add new DMABUF interface infras=
tructure
> config: x86_64-randconfig-161-20240619
> (https://download.01.org/0day-ci/archive/20240619/202406191014.9JAzwRV6-l=
kp@intel.c
> om/config)
> compiler: clang version 18.1.5
> (https://github.com/llvm/llvm-project=C2=A0617a15a9eac96088ae5e9134248d82=
36e34b91b1)
> reproduce (this is a W=3D1 build):
> (https://download.01.org/0day-ci/archive/20240619/202406191014.9JAzwRV6-l=
kp@intel.c
> om/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes:
> > https://lore.kernel.org/oe-kbuild-all/202406191014.9JAzwRV6-lkp@intel.c=
om/
>=20
> All errors (new ones prefixed by >>):
>=20
> > > drivers/iio/industrialio-buffer.c:1715:3: error: cannot jump from thi=
s goto
> > > statement to its label
> =C2=A0=C2=A0=C2=A0 1715 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_dmabuf_unmap_atta=
chment;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ^
> =C2=A0=C2=A0 drivers/iio/industrialio-buffer.c:1720:2: note: jump bypasse=
s initialization of

I guess the compiler produces code that will run the cleanup function on an
uninitialized variable. I would then go back to plain mutex() instead of mo=
ving
guard() to a place where it does not make sense only to shut up the warning=
s.

- Nuno S=C3=A1


