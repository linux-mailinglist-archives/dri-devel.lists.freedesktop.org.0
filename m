Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9E014BCB8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 16:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91FA6EE72;
	Tue, 28 Jan 2020 15:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794AB6EE72
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 15:21:04 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200128152102euoutp02fc55f778d313c3b52fd8f25ab5747c93~uFiPZYdhq0305203052euoutp02k
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 15:21:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200128152102euoutp02fc55f778d313c3b52fd8f25ab5747c93~uFiPZYdhq0305203052euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1580224862;
 bh=c+5xU8gjZGqZjMpG2KUe0/mMVcXhBH61/Bs24x6Qd9E=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=dgP5Cmdgrm5YxCNjiD/5RvX7yjhLmxAqyPjPu3ro6u0bk1bNFKviQdwvFj8Zg7V5J
 oSEJdTC8bowWSKt1jQarYKJunXXaI+mQYiZGSwjHUNHkjUTRYx36cxpgrPdf7T7+m1
 ScAXLUKw/5FT7s4+E2f1aGdGoyj/kWme5Ui8D5Po=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200128152102eucas1p148763110247c0d5e63b0020bbaca8430~uFiPFWOFA0561805618eucas1p1F;
 Tue, 28 Jan 2020 15:21:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 0A.EB.60679.D51503E5; Tue, 28
 Jan 2020 15:21:01 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200128152101eucas1p1cfd0983fb01439e55279b62448fd8072~uFiOT7HZM0549005490eucas1p1G;
 Tue, 28 Jan 2020 15:21:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200128152101eusmtrp25a14db7a27e704195c3240e0c3a66a8f~uFiOTP5Va0521105211eusmtrp2H;
 Tue, 28 Jan 2020 15:21:01 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-38-5e30515d39da
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 69.42.07950.D51503E5; Tue, 28
 Jan 2020 15:21:01 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200128152058eusmtip25574867aae5217c7a627d828c12d11db~uFiMGp6sN0896708967eusmtip24;
 Tue, 28 Jan 2020 15:20:58 +0000 (GMT)
Subject: Re: [PATCH] fbdev: wait for references go away
To: Gerd Hoffmann <kraxel@redhat.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <e16f568b-c629-b81e-ec3a-7c7dd6edb766@samsung.com>
Date: Tue, 28 Jan 2020 16:20:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200121055348.s4anrveo2z6avin6@sirius.home.kraxel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDKsWRmVeSWpSXmKPExsWy7djPc7qxgQZxBu92aFpc+fqezeLZrZPM
 Fif6PrBaXN41h83ic+MuFgdWj95999g97ncfZ/J4v+8qm8fnTXIBLFFcNimpOZllqUX6dglc
 Gae23GMpOCRYseFXL1sD40/eLkYODgkBE4nNf1S7GLk4hARWMEpc/DuXDcL5wihx49cqFgjn
 M6NEw+0HTF2MnGAdMz61QlUtZ5TYefU6C0hCSOAto8SKE+YgtrCAucSjD6+YQWwRAVWJhf+W
 sII0MAusZ5TYt+YJI0iCTcBKYmL7KjCbV8BOoul5I9ggFqCGnes2gsVFBSIkPj04zApRIyhx
 cuYTsBpOAVeJEwdOs4HYzALiEreezGeCsOUltr+dwwyyTEJgHrvEu9cTWSDOdpGYsXUJ1AvC
 Eq+Ob2GHsGUk/u8EaQZpWMco8bfjBVT3dkaJ5ZP/sUFUWUvcOfeLDRRkzAKaEut36UOEHSW+
 NC1hh4Qkn8SNt4IQR/BJTNo2nRkizCvR0SYEUa0msWHZBjaYtV07VzJPYFSaheS1WUjemYXk
 nVkIexcwsqxiFE8tLc5NTy02ykst1ytOzC0uzUvXS87P3cQITDOn/x3/soNx15+kQ4wCHIxK
 PLwzVAzihFgTy4orcw8xSnAwK4nwdjIBhXhTEiurUovy44tKc1KLDzFKc7AoifMaL3oZKySQ
 nliSmp2aWpBaBJNl4uCUamAUt7ZqCZf5taek+fon4U01hStc9D9bm6yczbr03CXmXRNMetOD
 5Wd+OHHPIe+gDn+rqUZ96w6241cUXmRUGHpk/fCZaCvCdF073sIy6IBDl92ngNksL7avTYqd
 UqXfbpizwOpqYOj/SxcU99lt2a/fKi16aCKj2Itp37QFFrsq+fc42AUesldiKc5INNRiLipO
 BAAlr2qRLwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xe7qxgQZxBsu7+SyufH3PZvHs1klm
 ixN9H1gtLu+aw2bxuXEXiwOrR+++e+we97uPM3m833eVzePzJrkAlig9m6L80pJUhYz84hJb
 pWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jFNb7rEUHBKs2PCrl62B8Sdv
 FyMnh4SAicSMT61sXYxcHEICSxklpjUcZe9i5ABKyEgcX18GUSMs8edaF1TNa0aJN68fMYIk
 hAXMJR59eMUMYosIqEos/LeEFaSIWWA9o8Sm32uZITp+MUqsunubBaSKTcBKYmL7KrBuXgE7
 iabnjWBxFqDunes2gsVFBSIkDu+YBVUjKHFy5hOwGk4BV4kTB06zgdjMAuoSf+ZdYoawxSVu
 PZnPBGHLS2x/O4d5AqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucVGesWJucWleel6yfm5
 mxiBkbXt2M8tOxi73gUfYhTgYFTi4XVQMogTYk0sK67MPcQowcGsJMLbyQQU4k1JrKxKLcqP
 LyrNSS0+xGgK9NxEZinR5Hxg1OeVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgt
 gulj4uCUamDc0F02x0DtocPOKfaOa29m/fkccfFOdW3WevkTU/vF7EzdpE4VCS2+euKTUUsn
 f/U3E8PJW+7NfZLeMHn1wQ3eCoahl6OXFDD7rf7R8PTXtFsb/Bk+CXz5lpbNYp+/t8z0GsOM
 8GfX5dcc3GMvdU3pblRVT6lW0EXxTElJ75ryJjulDQybu/KUWIozEg21mIuKEwGC5rG5wgIA
 AA==
X-CMS-MailID: 20200128152101eucas1p1cfd0983fb01439e55279b62448fd8072
X-Msg-Generator: CA
X-RootMTR: 20200120100025eucas1p21f5e2da0fd7c1fcb33cb47a97e9e645c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200120100025eucas1p21f5e2da0fd7c1fcb33cb47a97e9e645c
References: <CGME20200120100025eucas1p21f5e2da0fd7c1fcb33cb47a97e9e645c@eucas1p2.samsung.com>
 <20200120100014.23488-1-kraxel@redhat.com>
 <d143e43b-8a38-940e-3ae5-e7b830a74bb3@samsung.com>
 <20200121055348.s4anrveo2z6avin6@sirius.home.kraxel.org>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 marmarek@invisiblethingslab.com, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/21/20 6:53 AM, Gerd Hoffmann wrote:
>   Hi,
> 
>>> open.  Which can result in drm driver not being able to grab resources
>>> (and fail initialization) because the firmware framebuffer still holds
>>> them.  Reportedly plymouth can trigger this.
>>
>> Could you please describe issue some more?
>>
>> I guess that a problem is happening during DRM driver load while fbdev
>> driver is loaded? I assume do_unregister_framebuffer() is called inside
>> do_remove_conflicting_framebuffers()?
> 
> Yes.  Specifically bochs-drm.ko and efifb in virtual machines.
> 
>> At first glance it seems to be an user-space issue as it should not be
>> holding references on /dev/fb0 while DRM driver is being loaded.
> 
> Well, the drm driver is loaded by udev like everything else.
> 
> Dunno what plymouth (graphical boot screen tool) does to handle the
> situation.  I guess listening to udev events.  So it should notice efifb
> going away and drop the /dev/fb0 reference, but this races against
> bochs-drm initializing.

It has been a week and there have been no alternative proposals to
address the problem so I incline to accepting this approach..

However please rework the patch slightly:

- Don't wait in the usual fb_info removal code-path, only in the driver
  replacement one. You can achieve this by adding additional "bool wait"
  parameter to do_unregister_framebuffer()

- Add a FIXME comment just before the wait loop with the description of
  the issue (the above explanation of the race between plymouth and udev
  would be fine) so we will remember why this workaround is needed.

- Change patch summary to something more descriptive (i.e. to "fbdev:
  workaround race on driver replacement").

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

>>> Fix this by trying to wait until all references are gone.  Don't wait
>>> forever though given that userspace might keep the file handle open.
>>
>> Where does the 1s maximum delay come from?
> 
> Pulled out something out of thin air which I expect being on the safe
> side.  plymouth responding on the udev event should need only a small
> fraction of that.
> 
> cheers,
>   Gerd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
