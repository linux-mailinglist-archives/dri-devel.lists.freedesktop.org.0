Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D50B6CB769
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 08:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABB010E80B;
	Tue, 28 Mar 2023 06:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic302-21.consmr.mail.ir2.yahoo.com
 (sonic302-21.consmr.mail.ir2.yahoo.com [87.248.110.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F9710E03D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 00:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
 t=1679964885; bh=AW30FnYIjWdLuO0x0jWm9YgXrMh7ej06XUZ+z260h6Y=;
 h=Date:From:Subject:To:References:From:Subject:Reply-To;
 b=gsHHwvBHZzuixb001misVXHucb21FuEaIqFbcWKwMf5W6Q+nlN0PlZJiWPPtAjM+YiyXcilbyBSuT1lKuiNBz/em9KoHqdLoCjRwIct62eNNu4DntA0/7i+5uI9t175Xct5+/GYr53+nJVjZKZBjCOFnMBtqTQ0Q64aMKOGFdforAQzuwwwwLHJlwcQ5Kq1UAZnmq2RwYfCaCxQjpi2mWUC/ORPaBv2GS09B7i//inhTRmNJUhepquoOIeBmYAMujabMM4VvXb1jx75JKL58AM2Iv4uFFLT+I1uUEsZOBjcHXTQx2ORIA+SPrK5nek4NhoKBjl/oiGYZQgg+RLvlXw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1679964885; bh=70JfELd/bXPk2Y5y9g4ZtjrYlYD9xInOetqz+cBFsdk=;
 h=X-Sonic-MF:Date:From:Subject:To:From:Subject;
 b=XM+SshmCUY1XI5IWzqVL8KG/tCKiE3YSsOK0RBuTezcDQyRuQk3q3J2X3y26hQLdttqDhuncvFvcAlyz7IzKxweUWQSlfKhLyYFrUOgFkdhr+h3wW0lKnAyww/x5PMbniXZtoKgFEQ7H7ag9yNrv5hLjXGP66BnWvcO6wZs6+bnVH2q0pQiYvz/yGLj2ZAa/mhR31v9WOJyMKfOexG3Pj/h53l7Ugwx09UeovIsFLIc9+m9nk90qQLUsJrymD84HJS+LSCZGHg/050IwLmIAyzbhvvgQymactv+U/J8ECADEAAuj02xEb1UcjZxs9yRjBuyFuXRbwkNfgPzx72b3tg==
X-YMail-OSG: vGaNC3UVM1mCRTN782VGUg.Wdf61JabNYTeDcb8mD2jeLQLaC89Z.4SEDWu4oFE
 35cOwVkJTNiTxStQHGiR29_CzimprzKvqfK_J.OGJKyVARfhDKCui6lOGCuK0iwGZCrel6uoDsHW
 4JJmkKhvbs3FF.ssrkG42kCkl3bwy0ILhJygRtTUAEbLzC1_nBule.yRg.VR9Rhfpkk04ZrAZWct
 qu45cgHF0bUuUHPcjxRolwHIM9YGVCJhbCksn14wbErF6drSAQbLGZ2MYSOsPUzyLnVoEyeYfQhU
 n7nqP95GcWrSmXkVNYCtxslqCeXjMw3zVMTPqeYLU.yxA2l1Eo9QKEbht4UfoLXemzh9NHGsRULX
 mmnuqcH89KUcafV5EJD8Eu1YtJleLXB7H3cWz6lOaqEWatHJEABFCWfq60NWTLJ6rU8DIbu6zClR
 TDUJkF8SqOiszgmQGEAk4I41SIqEkdf3wIJ9U23Y5vdO6PUnbVRosWZoIicVe185LUSrJRxmnJ9m
 0kZkrt3yW5fsDdcdfK27YSyypdPj6KnfAS7OAY3USDaJPiR.1HHUfOsfBcQ.igcwsDnDBoGWxiPV
 qJEF1w41naYq2qtj54ngZcnz4HK3aZzHT0eY4D27u5Ppg8vHTe.bUeycVmEXSzDhMdTe7Dtrgsu6
 5iqKjj90d4.MJWZi_ArFsWDDYQB3JMZwpNyCLuSk1Oa4SDjbt.AXd9gj_ofXq3FucYM5Ek.OWqXJ
 k_bIzYCGZze.UrlTUhqXJzZCPYFkvvmrU2dCF1HlJt1ykUD6YEzL84auW1r5Pd9jYaWxw2Hj7Trd
 G3SC.QX3RI0LTsZut.uc9W7Nj2UJ1Q2Iss9_GXgJ3ym5cJx1L8blKqMFcY7MKNPAF1l6o6BA6JRb
 Ih7z49RFqJYleEBewAUrtKbk8qiDHh0szG1n6H5OWxzUpgctZ9YuYOb30DaM14R9VM3aFgQ5rBJY
 Co4O2LRLB8ZxvclE7AMtJtEOTGAs_oOxRqizArjlp44PFOlYochk6ul2OIECeSpWXr_xUNuQgrwx
 YMBkkK90Y3ZMKXaMZPiKIAjAUOy8BjSJXMk4B09ns6VBcC9nM.x4VYymtlTp4buhv35azAXXxU0S
 vI0EI2WfbFcDqFaV4HA.XMlrLtEbK0oSYaHujBLoeHdUFxIDuzLBpJF207gXo5DwruSA2AD9x633
 .794o1MzwjIMi_M9Ctx.JXFig3BvLkwi8mIozzjcVOKti4WIMsZPjud9jcW7fyihCtAnoHsYO53F
 b.E_h3fH4.mGAW3nKT72rMa55iSbgz6RtKl9e7h4QswcJdL36OZN09FXfQ0G4N5r_nxSy44.m.dT
 RaXKxurIWuvhNdl1kjrfWqG6MEA9lHtRpK8JbXAvsCBjOL6Sv1rzrOCfCHgrZeWi_V3xch.2vGdT
 1TS71Cc9MVazP37_Bo6lSrAdK0t2NNNwmvPyh_y7UVtHV9tylUmLYOgDX7QYVufb8dQPF6M3VYN4
 VWLIyVzKFIU3aHv9Jt_k8kvwvkYtlZqqW8Gql6nS0sMTJRL8r9eZIgzzeagozotsXjpwr6YWVGv8
 Ts3z0ivMEyK5FyWzTHvEfCD.jG6eXD41KKOw8l2YYAKhr.0MAb8eA25oRIMCQQpga0sBzoIMH5eq
 vaxg832KwBc3FrQpYE6pLBD.sV.9HZIL6fWdlKLlLeG6LMwcgwFD5xR53w20_Ow.nZ3.EFCPiOPk
 ZtFkOr9rkAwRupZIBSq8k26wm7JqhVwzSPBzqu_EzCaN.Qf1EYUzC0GRu4uDx.khmDc2wann8f7F
 dakzU3I2.CnNVNaNxVwKaZK1UkeAyJb81qeAb2smj8Nc0Pwvq7rdeGdCbE56MNQYB9GTZw4zhsHf
 gEJWTmu5_ra1XRahhTAKHT3oiHZms8onhSLKE3DLiEQl8XjKsLt_UHcq1xKTRvIc1Yl81qBcUuba
 .vF6G2NdZeNniPN_xSGMvgz2zrhD7HGUlM7n.hGsPJti7bFkFdLvLt6yP4OX6opm9dIbDO98ue5P
 nir7CUe7ndI4nWDzXY9oQfcGHksnFGK.bcFjOhn1yGSZqS4U4LCPYy8aCgBZge6UrG5In7JGQb5j
 HGb9crWhggrqnjIa93fNHUiIiLFFs3f51hOQ6Uwt8Q8JhlvaXa3XS0ganV4PzXDRKx1Wpk57Y1YT
 SEliJolBjpz0Ux_9ffB4.MQCp6gGHwg21baFCOXZ0xF5dN4RvJ8vm2HirT2zjQp3KgGuDm358wut
 Bcc_ViSItz3.Fhfusp8SgVdOdjpsiFgSQswb1gbr8FZ_iAV1NhJH0gnarNQlIi71lUC9JajrsTWH
 9HI1S3DVbHYzEC2ZIV592.TU-
X-Sonic-MF: <danilokrummrich@yahoo.de>
X-Sonic-ID: 1980f7ed-2e6c-4d55-928c-d47a9bfda5ee
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ir2.yahoo.com with HTTP; Tue, 28 Mar 2023 00:54:45 +0000
Received: by hermes--production-ir2-5b7d458747-z6qxt (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 8f36f44b129f113ce22563ab8baba8ea; 
 Tue, 28 Mar 2023 00:54:44 +0000 (UTC)
Message-ID: <e3e07282-136f-5239-96ae-4aeb2d3c95d7@yahoo.de>
Date: Tue, 28 Mar 2023 02:54:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
From: Danilo Krummrich <danilokrummrich@yahoo.de>
Subject: [Regression] drm/scheduler: track GPU active time per entity
To: daniel@ffwll.ch, Dave Airlie <airlied@gmail.com>, luben.tuikov@amd.com,
 l.stach@pengutronix.de, Bagas Sanjaya <bagasdotme@gmail.com>,
 andrey.grodzovsky@amd.com, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
References: <e3e07282-136f-5239-96ae-4aeb2d3c95d7.ref@yahoo.de>
X-Mailer: WebService/1.1.21284
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Approved-At: Tue, 28 Mar 2023 06:44:16 +0000
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

Hi all,

Commit df622729ddbf ("drm/scheduler: track GPU active time per entity") 
tries to track the accumulated time that a job was active on the GPU 
writing it to the entity through which the job was deployed to the 
scheduler originally. This is done within drm_sched_get_cleanup_job() 
which fetches a job from the schedulers pending_list.

Doing this can result in a race condition where the entity is already 
freed, but the entity's newly added elapsed_ns field is still accessed 
once the job is fetched from the pending_list.

After drm_sched_entity_destroy() being called it should be safe to free 
the structure that embeds the entity. However, a job originally handed 
over to the scheduler by this entity might still reside in the 
schedulers pending_list for cleanup after drm_sched_entity_destroy() 
already being called and the entity being freed. Hence, we can run into 
a UAF.

In my case it happened that a job, as explained above, was just picked 
from the schedulers pending_list after the entity was freed due to the 
client application exiting. Meanwhile this freed up memory was already 
allocated for a subsequent client applications job structure again. 
Hence, the new jobs memory got corrupted. Luckily, I was able to 
reproduce the same corruption over and over again by just using 
deqp-runner to run a specific set of VK test cases in parallel.

Fixing this issue doesn't seem to be very straightforward though (unless 
I miss something), which is why I'm writing this mail instead of sending 
a fix directly.

Spontaneously, I see three options to fix it:

1. Rather than embedding the entity into driver specific structures 
(e.g. tied to file_priv) we could allocate the entity separately and 
reference count it, such that it's only freed up once all jobs that were 
deployed through this entity are fetched from the schedulers pending list.

2. Somehow make sure drm_sched_entity_destroy() does block until all 
jobs deployed through this entity were fetched from the schedulers 
pending list. Though, I'm pretty sure that this is not really desirable.

3. Just revert the change and let drivers implement tracking of GPU 
active times themselves.

In the case of just reverting the change I'd propose to also set a jobs 
entity pointer to NULL  once the job was taken from the entity, such 
that in case of a future issue we fail where the actual issue resides 
and to make it more obvious that the field shouldn't be used anymore 
after the job was taken from the entity.

I'm happy to implement the solution we agree on. However, it might also 
make sense to revert the change until we have a solution in place. I'm 
also happy to send a revert with a proper description of the problem. 
Please let me know what you think.

- Danilo
