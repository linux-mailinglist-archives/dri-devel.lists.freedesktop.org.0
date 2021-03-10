Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9435D333FA5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 14:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B898F6E1EC;
	Wed, 10 Mar 2021 13:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic314-20.consmr.mail.ne1.yahoo.com
 (sonic314-20.consmr.mail.ne1.yahoo.com [66.163.189.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDFF6E1EC
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 13:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.net; s=a2048;
 t=1615384367; bh=GmbMVgM89f5mI9qh8DSRP3ZoQIZRV4JCgkYcOPdG84Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=rgCaj0JbrsAWunFmIScmHTWbBq3rw9YPmPGQOXT9VdhNIoqCorB3zgQ4amy9q7dsQFWZwPQRT3JcbzfbREbYRiKnVXJkm0eoAmMIHTYiCc+SZfyKEQsf7zklik4YXNLkAbOZ1fPrJG3mpAV4xcwpfqknND999Km7n7iuRDUPQZ8/H8PYqG5OY2JSQ6iZkSIO75rHsHClBEt43obM6rAnlPm6lYGdRPg8mFJwMzilOmpW/eEUDog7PjeKyLu8Yp8olzW4rMH1aMYCnP0HAHMGeqaruOCi2V690j3F8cpY+QOcQZOBf6vs7GQ1xQ0C6davrfHyPYij0W14fLAZf02Yxg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1615384367; bh=vhYm0PXh84iRfhj7+/D6S4VRS90qCoCXzfLjCcIT1lm=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=kW2QbzOe2mnYVfQC+njuhp0Cp7NcgXFb1/40YDrWVoueB7eDT+JRG1dfZdZzjSo4xeKuWBWHv5QfE/+yUw2FbS5W+6s9E/M52lu/G3ur0cKY/EaBoS7b6kpHdG0NPIBQDUTE03wK5I0q93lBBfEo0CVR4UnYLJDG3IIckqdchpfsz+KxRVDcREVi9cieM0B0GMC8u9PoPB/U3f34hpdQ1wrcAWUw5VnXUWmIlpXUuEBUC+m2SNn1FpAcr0cRqzKy6EcwhWy269PRFRgBNBd08MtrsaWyYm8A+KMR830InZmIOS34skVI3coz5BVKO0imDP3KP9sxXb08GieVtDoPjA==
X-YMail-OSG: Mq7yqeUVM1m2wzdQH__3l27jYItp6rAnD.zAaAfpvs0AlgiuocaL3uHujl7F4hJ
 yeLXGb06oELFDR2dN7cBLqWJyiT_dOzLwTcQZm8lipU.io7DxqQZCD5IUkowLANXddWYdyQceQKn
 lyYnF0uTyZ3_knS19xPNNlglbycUt3_Yz0DRrVVbqqvfhBFbya2kWj8vbWUG1DzdSg08M0VPEDSK
 euH.XQQLyynVpv8DoiyDzemy1T1bjvWYbUbp43nGNcYzpiiaPMOuE_w.tyXP9r3P2_EPy0GwvBiu
 Qn9QM_.QvO3pmoV3ZQENG1HhoC8EJGf0sqWIj8noXoEs3.pLdrw0auh49boh0Ze8KZ6l9gXh0b3H
 8GLuvGrMG8dk.okej99ylTiTbYlDqwHi.pUqa.8Q7mAjltW2oHO8uaJdOTQb7aaHhU6Y8oGDiW1x
 yvxBXP7PzuV1a_JKub7zfFlGuqICBcmmJXvaxEIf5f6Vap8kWb34889FkC.NVygckSE1ZZejUlXw
 FPXe239KaDloHFV1iDCehGqYCI2nmQ8ydyb9FGEaZBpuHA2qvhdhLBMAs7.9NcGkSdu4HKbue7fo
 NRGMI7JkGVmPJPOhwpeFcBo2qWS5r__MjRs6mi5XSrxHpmyJdT.Us1_UtdmYkqKDJQVetR9fbDV.
 nqhQHCmr7rIDcbitVcEOYUJ3jF4Vc18PY4WZPxBfLphPGm.tSzZoIVTutaauqfJ11TbtQuIRjanp
 z7nV0fsalXSQKnvnwPQQmpImtIL9SLjWYdzz5ffpx.GIDW0t8oySrcaazkp9lw9LSk3JpK2uoYY9
 a9hGUqr6Ur2YWnbp5o9Fqn_.Ss1QrRHqFM0Mo5CcftaoqNfvOSWVdWxKY5HVzgBCr8iiz6jZGOn3
 Gq2bnR0Uicw4rKYpWYAK5zoIRF53Z8pTUqZf9KmCnFHsybt8unI6_792CBoW4AFnTjMGoNAl1H54
 ULvYAeeeCjIn17Ijz9A2vZk_NDGUzxEirBqa3Vzor1ZxsIbZe6by6VqoGNtero77_cRabZAiZzP9
 zAfN0w0eF5VfqwxLb7VJOEX1GFTQgFor3SnHyqZ3eBjz1WPjFx9tO15wJaTyKhl.k3rFZLRPFn6T
 2FH2Wu6YsiAdBcKNPOtcofAp1mXCMDrbNt2Jq1nWn65qbwBvnfWt.5jmGyGvq7qWozmiCH2vFN7j
 WZLtOiznKIL6SQA65y8ypDp3THi7PdITVQv1NVf7cYqGYKgwYLLsDUK04oVtjdvXzCqXEIX_Z2g9
 7JYlYZGYxrOs2asnQf7yzQZU4Xe6XcGCMXgVTjhq4fMS8Z58L39668xqUkGcH_b0aNpDbLGXOn7f
 T.Uy.pWuKAB12luGzerwmLmXRgZ5kYa3lbaP34FwI273yaiGCFHTvbyq45m7AxyqGkmurHoQaGb.
 OcmrD0M8DvTdVpsU2hT6ph4pFVNkB1PENyfIgF8hMd1rMLu0glRw9UA4wIBJjYL43cgxeuUaTpmA
 VynviA9L05_Ds91ZgxV.ozHUH1ClqT3BK._zz7OY0JVXdYflnpiN1wiJ7Yt01XGddDC5F52voRfe
 qbEPFL_2PlEDkZE.oZf4MXYFTdn8VgEiYSb.26cxzACdyI465Iv5ELlCkqnQStBDzoR2awtuX1QS
 LNE6MkzkL1W14styY.VHPqnKmEjom_gG4M0r9ybT5P6NCtqpH.pMrScvc0UAvryQRFX3978QYcWD
 3MBOS04XlODbabthTV6rodCF6LsGeMk1b8hQN_IG3QuMSq2.qfPFRRAQrP3QdCqsTfmA1uP1E2Ww
 tXYlc8nOVXMOsBI7H.Heua6nbsTvRfvk3ynqXvMWu26EJwKNtOiVyQ7vWJJRuWsvm4lnL_Yx9YRd
 l0grSzPPU9JayyrzrKY4de_J5Q6LDsJ.NswYYKVhM6Wj1CQHSM5IGB6ONa.j1DkbcCHcSZtDPV4u
 2wMzs2MjmkDOPL19nvVGZD0TYJdxTAYQa3fGIQVY9XO5A3NZtUL4zf5ZFJXn8KIvKBRZYihwVc8P
 t_64v68D5FnvXj5yV1CHYG3Uq.9c8FpBZVFstD_8j7W_bb1uI6bldYZkTh4Yrcwq7Sqmpo42onyB
 GTv1uq18edC2kDSdvB8qBEuqs4njdFdki4y0cJoLU8279FbBizHLnPZv1B_06hlQnyzVvHVsraA2
 ZuGaf5O6GI4fJ3TD1jaOXSK62apgT7JxthPJmRqmVDAdtG0ZKkUru9JEfhmymgiserk7squG2XvW
 MzyrTx1xVgN5M04RYhiAitDVFDsM9O6WZe38kKdAJjm87Ox1ZDUkuqG3DaLtwpuQF.97UWSQc4EN
 wHF9j5cvHVcEegd4GwAsmXPUf40cnz3cleU4AG8UD34H2IBmPu2yog593sqbIdnbxrIoXS1GaJnu
 BW1a7UVpjOcjOkg2neULAuzzC6GQrKBI8Vjq7BM4gczLjHmydYYRm7dYJNPD2.MjXiq_9yDcWpDv
 Gg1Km6Ox37oMMcsAH5XDbTwtFT5E1edgIdsZ21GJX6g--
X-Sonic-MF: <bluescreen_avenger@verizon.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.ne1.yahoo.com with HTTP; Wed, 10 Mar 2021 13:52:47 +0000
Received: by smtp418.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 8e7145a72e12a48e645bb0778d458ba5; 
 Wed, 10 Mar 2021 13:52:42 +0000 (UTC)
From: nerdopolis <bluescreen_avenger@verizon.net>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 0/7] drm: add simpledrm driver
Date: Wed, 10 Mar 2021 08:52:41 -0500
Message-ID: <1772991.WR6T9Md6AR@nerdopolis>
In-Reply-To: <c5db27fd-40dc-8800-965e-84be2f562d65@suse.de>
References: <20160902082245.7119-1-dh.herrmann@gmail.com>
 <1819978.CKrAbXhGjX@nerdopolis>
 <c5db27fd-40dc-8800-965e-84be2f562d65@suse.de>
MIME-Version: 1.0
X-Mailer: WebService/1.1.17872
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
 Apache-HttpAsyncClient/4.1.4 (Java/11.0.9.1)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, March 10, 2021 4:10:35 AM EST Thomas Zimmermann wrote:
> Hi
> 
> Am 10.03.21 um 03:50 schrieb nerdopolis:
> > On Friday, September 2, 2016 4:22:38 AM EST David Herrmann wrote:
> >> Hey
> >>
> >> On request of Noralf, I picked up the patches and prepared v5. Works fine with
> >> Xorg, if configured according to:
> >>      https://lists.freedesktop.org/archives/dri-devel/2014-January/052777.html
> >> If anyone knows how to make Xorg pick it up dynamically without such a static
> >> configuration, please let me know.
> >>
> >>
> >>
> > Hi
> > 
> > I am kind of curious as I do have interest in seeing this merged as well.
> 
> Please take a look at [1]. It's not the same driver, but something to 
> the same effect. I know it's been almost a year, but I do work on this 
> and intend to come back with a new version during 2021.
> 
Thanks, I'll try that out
> I currently work on fastboot support for the new driver. But it's a 
> complicated matter and takes time. If there's interest, we could talk 
> about merging what's already there.
> 
> Best regards
> Thomas
> 
> [1] 
> https://lore.kernel.org/dri-devel/20200625120011.16168-1-tzimmermann@suse.de/
> 
> > 
> > There is an email in this thread from 2018, but when I tried to import an mbox
> > file from the whole month for August 2018, for some reason, kmail doesn't see
> > the sender and mailing list recipient in that one, so I will reply to this one,
> > because I was able to import this into my mail client.
> > https://www.spinics.net/lists/dri-devel/msg185519.html
> > 
> > I was able to get this to build against Linux 4.8, but not against a newer
> > version, some headers seem to have been split, and some things are off by 8
> > and other things. I could NOT find a git repo, but I was able to find the
> > newest patches I could find, and import those with git am against 4.8 with
> > some tweaks. If that is needed, I can link it, but only if you want.
> > 
> > However in QEMU I wasn't able to figure out how to make it create a
> > /dev/dri/card0 device, even after blacklisting the other modules for qxl,
> > cirrus, etc, and then modprobe-ing simpledrm
> > 
> > In my view something like this is would be useful. There still could be
> > hardware devices that don't have modesetting support (like vmvga in
> > qemu/virt-manager as an example). And most wayland servers need a
> > /dev/dri/card0 device as well as a potential user-mode TTY replacement would
> > also need /dev/dri/card0
> > 
> > I will admit I unfortunately failed to get it to build against master. I
> > couldn't figure out some of the changes, where some new structs were off by
> > a factor of 8.
> > 
> > 
> > Thanks
> > 
> > 
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
> 
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
