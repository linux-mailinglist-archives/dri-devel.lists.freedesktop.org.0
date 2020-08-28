Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B78256659
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982326EC07;
	Sat, 29 Aug 2020 09:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809D86E06E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 16:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1598633577;
 bh=qkPTOvtTGRigAt7SKSkMWItH7Z6Xc3wPdBbL9u7L8Vc=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=SCX0gLTf4brWIquOOqLQJ/ixLZ42H7CmMWHA5fyE2l0paca8e9DoO15Vp7kNXLrrp
 FjdYOdI+ujZAyZ3LgNZBtF3Uvp+b3ZWXULFFbDpZVjyEhshHwTyK9aEjgYnsX2zZGN
 yDiBn15j9wsp0YwaD3SFHf/A0qU2Ax2ZzRWQo/oI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.21.78]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0McnqH-1jttkn3H4T-00HuiG; Fri, 28
 Aug 2020 18:52:56 +0200
Subject: Re: [PATCH] coccinelle: api: fix kobj_to_dev.cocci warnings
To: Julia Lawall <julia.lawall@inria.fr>, Denis Efremov <efremov@linux.com>,
 kernel test robot <lkp@intel.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-nvme@lists.infradead.org
References: <13cd8bf4-06f9-04d7-e923-c397c506e8cc@web.de>
 <alpine.DEB.2.22.394.2008272204050.2482@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <8387e2b4-cf1c-c6d9-9da5-0bb12cff5e6c@web.de>
Date: Fri, 28 Aug 2020 18:52:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2008272204050.2482@hadrien>
Content-Language: en-GB
X-Provags-ID: V03:K1:uSXj4U8dSWh0urx+9uu9tjsUulylfI1zTfph9HN04SrhTi81gEF
 sfRIdwecDSoLTWXfGHQXujPWapdX99LQUbOw2V0C0YBTFmYw0XiL2PD2cRZeea2ZvwifTbH
 3aLTkxDKRXBrXKa0RY8mN0GVlzVm4C0aL5o2W9PVnjQAYpEK32+gXtKtI85lhNa4VCwLF4O
 TS0IIIWqb0wAhRxv9YZBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:N7aQleD3OzI=:gFiGOmMqYLA710A4MCH4tY
 pPqzDjJlNX/tctM6sYx83jJZnRWzI2Gx9rTSEMH4TNSEYYX65NSH4GlEkaEhs6To8GBOFg+t2
 LzJt5VEJJDbw8BnuXWabGIweB+uV7zrXeWHKEg132yFMnyW4nZQ+/NmbEEdPGHL8v3vAUKP6Z
 OfypE9JGvUB6n27LYLrxQVPYA9hOn0SBkchslUPUlpeyKgsoU0KUrl/gSmO0YMufpIWZIcXc4
 23Cdr7hAPJH41IbRM3nHk9QOB+8N8mk3DzThQxJXr11BHDjfo06IdqKYs7r8cKPYnmWz6WeiJ
 Wa9VsCVSoNXvxXzdIhUwHdw4A8weaVuTYSfcqtJfY4eznCC7Eu/6irwBz6GJ3Y6i9eo1tAzSk
 KJUNk+ZzfxJZpbUOtVguB9w/PbFKPS2IWvMWHQsjpeK9CeCAQZgt4XtT7B8tib/FgjO4Xf9U4
 gkQKcr9H+FMC5Ac4v7UC646VB0VnUwv8DlZnCTjrAynksPwTOX+R73lPkHnV0PR6jbbPULKvp
 mWp5+6Rr3RugDVRD5jKI1U+gKCAAhgu9TXWRKCYH+yjPjOwlmUlnwM3I5KmGlZAAjMPyrnkZp
 J4dZyzxKYZq2fyoKDvRd8vEoIiTGff9VoYXXBf6GZRFarl5BSNpMD1QCknLcz0lvs7Ezirs6l
 QkIu27akO/rsVJr54i5tNWpwmsTLPzkWvm6zf/3ybh0/QWhrf08SOu75zVB1yhMcnc2/Oyr0l
 UBW/fghj+/8aoPIknxoxb/Jp+8oPNEpQmasLFvmjIo/7Wyc9ByAywJSwzZBPVydiYvElJUZYO
 RqHnfhBn/HbPsGcyaiX7FWDiP429krBthV+DPwneEekpjyK+sjnCJ4EsD1JMliDF+hsVHH429
 hvauem05GxIEx7WxRQEN14eUEIAcZNXGYL3DOUfZmDSQSYXFhR15y301sVRUyiI1T6znb1/Ws
 IWcK+4hPkvd+L6+IN9g7vhBhT9gjUGlvnrkMIcWx/BjmykDWeRqhZvzQHHy1hu4v1GTl7iUeT
 HhbfHuHP3nW/FrtOvaNNPuJacawQZVjurTkenIOI2QB9MDSkzS/pftOyxeODpXKkJtApQSj6f
 yp1X6aYSm0cdcw3YHnkEZAqBwsd+Yj46+K3b/LtkSMZRsP9g6v+WFjQg1WBtC6NjtIcGUV9rz
 xGGnHIMkrdyYUPCh6n4LqGvgBRV/OqwTZL8IvLRS7h0E57BwPwwMCbPz4F66JWmlCZvVKrrNl
 fSjWEh3+QbI/VeJJva2FTP+0yZOlj+1pghOx9Sw==
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: Jens Axboe <axboe@kernel.dk>, kbuild-all@lists.01.org,
 Sagi Grimberg <sagi@grimberg.me>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bernie Thompson <bernie@plugable.com>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> It seems that 0-day picks up new semantic patches that are added to trees
> in kernel.org, but that it's strategy for generating the patch is not
> ideal.  I'll just drop these Fixes lines.

* How do you think about to adjust also the prefix for subjects
  of generated patches?

  Another example:
  https://lore.kernel.org/linux-nvme/alpine.DEB.2.22.394.2008272211260.2482@hadrien/
  https://lore.kernel.org/patchwork/patch/1296616/
  https://lkml.org/lkml/2020/8/27/1377

* Do any scripts (from the continuous integration system) need further
  improvements for the safe and clear application of patch results?

Regards,
Markus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
