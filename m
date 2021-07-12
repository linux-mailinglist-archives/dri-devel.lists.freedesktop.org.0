Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A583C45BF
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 09:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA1889A9F;
	Mon, 12 Jul 2021 07:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009F389A9F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 07:09:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 638CE21E2C;
 Mon, 12 Jul 2021 07:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626073765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ec/k72ngx+FC1FFtpHgC7mX3giOrDbUajmIyiuukJKw=;
 b=WwwXSjcloUsil3DnyVA+Gc81MQmJ6mcO1jSZJ3whsk2y+C/C6im0kwIv3NodZJp/rtrNBl
 dXsZrCqrZ+fWHiul5bOzmtSy6C5wlPnk327CxvMJa3EcMxMxKQH6/ZLXts4cu3bHg6ROub
 WsScdwzJpZZ7KG1NM3X1XQKpubHuhXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626073765;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ec/k72ngx+FC1FFtpHgC7mX3giOrDbUajmIyiuukJKw=;
 b=Taeg8Rh0Hm0E1rZNXvDsVdzgcjcN/OQUSJCHktttFJo+Y2qjZ0HdAEfeN25l0gzF0Yyvl8
 3uEOcFzcr1Ya/QBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 12AB313B7C;
 Mon, 12 Jul 2021 07:09:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WX6QAKXq62AHewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jul 2021 07:09:24 +0000
Subject: Re: [PATCH] drm/vgem: Restore mmap functionality
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210709114731.31467-1-tzimmermann@suse.de>
 <CAKMK7uGyQ5Z+o4LB8KvRgACvKDDL5Ymo3Wp6TRJ9+3kEnCi2RQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <39d3ed07-3868-3d21-9ecb-78a1e226668d@suse.de>
Date: Mon, 12 Jul 2021 09:09:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGyQ5Z+o4LB8KvRgACvKDDL5Ymo3Wp6TRJ9+3kEnCi2RQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="m48NLFwvCtEnHMpxxZY0V7XOr3bK954lv"
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 "Wilson, Chris" <chris@chris-wilson.co.uk>,
 Melissa Wen <melissa.srw@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Qinglang Miao <miaoqinglang@huawei.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--m48NLFwvCtEnHMpxxZY0V7XOr3bK954lv
Content-Type: multipart/mixed; boundary="1jGlyQu7QdCjUROuLaf1Z0ubmeBgBGIDk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@linux.ie>, Qinglang Miao <miaoqinglang@huawei.com>,
 "Wilson, Chris" <chris@chris-wilson.co.uk>,
 Melissa Wen <melissa.srw@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 dri-devel <dri-devel@lists.freedesktop.org>, Lee Jones
 <lee.jones@linaro.org>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <39d3ed07-3868-3d21-9ecb-78a1e226668d@suse.de>
Subject: Re: [PATCH] drm/vgem: Restore mmap functionality
References: <20210709114731.31467-1-tzimmermann@suse.de>
 <CAKMK7uGyQ5Z+o4LB8KvRgACvKDDL5Ymo3Wp6TRJ9+3kEnCi2RQ@mail.gmail.com>
In-Reply-To: <CAKMK7uGyQ5Z+o4LB8KvRgACvKDDL5Ymo3Wp6TRJ9+3kEnCi2RQ@mail.gmail.com>

--1jGlyQu7QdCjUROuLaf1Z0ubmeBgBGIDk
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.07.21 um 16:43 schrieb Daniel Vetter:
> On Fri, Jul 9, 2021 at 1:47 PM Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>>
>> Commit 375cca1cfeb5 ("drm/vgem: Implement mmap as GEM object function"=
)
>> accidentally removed the actual mmap functionality from vgem. Restore
>> the original implementation and VMA flags.
>=20
> Ah yes that explains things.
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Apparently, this fix fails a number of other tests. [1] Can we revert=20
the original patch for now? I'd like to have time to investigate.

Best regards
Thomas


[1]=20
https://lore.kernel.org/intel-gfx/20210709154256.12005-1-tzimmermann@suse=
=2Ede/T/#maa12be2a6d4b6a4ed8cb05e98f00b8955638c518

>>
>> Fixes access to unmapped memory:
>>
>> [  106.591744] BUG: KASAN: vmalloc-out-of-bounds in do_fault+0x38/0x48=
0
>> [  106.598154] Read of size 8 at addr ffffffffc10c44a8 by task vgem_ba=
sic/1514
>> [  106.605173]
>> [  106.606678] CPU: 1 PID: 1514 Comm: vgem_basic Tainted: G           =
 E     5.13.0-1-default+ #990
>> [  106.615535] Hardware name: Dell Inc. OptiPlex 9020/0N4YC8, BIOS A24=
 10/24/2018
>> [  106.622818] Call Trace:
>> [  106.625289]  dump_stack+0xa5/0xdc
>> [  106.628642]  print_address_description.constprop.0+0x18/0x100
>> [  106.634439]  ? do_fault+0x38/0x480
>> [  106.637872]  kasan_report.cold+0x7c/0xd8
>> [  106.641834]  ? do_fault+0x38/0x480
>> [  106.645274]  do_fault+0x38/0x480
>> [  106.648535]  __handle_mm_fault+0x935/0xb00
>> [  106.652676]  ? vm_iomap_memory+0xe0/0xe0
>> [  106.656634]  ? __lock_release+0x12f/0x4e0
>> [  106.660696]  ? count_memcg_event_mm.part.0+0xb9/0x190
>> [  106.665799]  handle_mm_fault+0xd0/0x370
>> [  106.669675]  do_user_addr_fault+0x2a0/0x8c0
>> [  106.673908]  exc_page_fault+0x64/0xf0
>> [  106.677604]  ? asm_exc_page_fault+0x8/0x30
>> [  106.681739]  asm_exc_page_fault+0x1e/0x30
>> [  106.685782] RIP: 0033:0x402e12
>> ...
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: 375cca1cfeb5 ("drm/vgem: Implement mmap as GEM object function"=
)
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
>> Cc: Melissa Wen <melissa.srw@gmail.com>
>> Cc: Jason Gunthorpe <jgg@ziepe.ca>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Cc: Lee Jones <lee.jones@linaro.org>
>> ---
>>   drivers/gpu/drm/vgem/vgem_drv.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vg=
em_drv.c
>> index df634aa52638..f50fd10c4fad 100644
>> --- a/drivers/gpu/drm/vgem/vgem_drv.c
>> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
>> @@ -364,8 +364,17 @@ static void vgem_prime_vunmap(struct drm_gem_obje=
ct *obj, struct dma_buf_map *ma
>>
>>   static int vgem_prime_mmap(struct drm_gem_object *obj, struct vm_are=
a_struct *vma)
>>   {
>> +       int ret;
>> +
>> +       if (!obj->filp)
>> +               return -ENODEV;
>> +
>> +       ret =3D call_mmap(obj->filp, vma);
>> +       if (ret)
>> +               return ret;
>> +
>>          vma_set_file(vma, obj->filp);
>> -       vma->vm_flags |=3D VM_DONTEXPAND | VM_DONTDUMP;
>> +       vma->vm_flags |=3D VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONT=
DUMP;
>>          vma->vm_page_prot =3D pgprot_writecombine(vm_get_page_prot(vm=
a->vm_flags));
>>          vma->vm_page_prot =3D pgprot_decrypted(vma->vm_page_prot);
>>
>> --
>> 2.32.0
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--1jGlyQu7QdCjUROuLaf1Z0ubmeBgBGIDk--

--m48NLFwvCtEnHMpxxZY0V7XOr3bK954lv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDr6qQFAwAAAAAACgkQlh/E3EQov+Di
CQ/+O/Afx0e8NNfE+sw8FHiWe+/abETlrTqq217/Sgn5Gwo28uPBSFNYv+r/Lwf4HFTA0ovuwo5z
s7jgdknqEVHckz3I64nVlNhdcOJ+/NQao4jGs1bLSZRT2/rODuN6awUvoJrqQAgu5U06SKxBYDuo
F9+tiNpZZopSPhlBVsFQlbyWAO4UNbtE++7GnUNMQ11pMrkscuLOkIL14A5ADN80KYJf2LD017Nl
azr/lh1ZWxMl4goVNoMdu13omDAAN5H9jMAyaeRmtqwSselKHGuZvkhA296mBEj4JksLj4RT/iFc
Pypvu3klUR6V5mXX/lteeMHk2EuqUTevcWZS7NUFQGjoNZPYwFAvl27FHgCemEejzp2+Vd6O8sy8
LSHhdt2GFdN2PAGesFeXws8VEl+MVAjCKtieErJr6M/pYyxFQVCVcJ/C6ZUylJqBBroj5tZYC97x
/bM3sVVc4alejstzwBuyh0LQSl0w6JJsVPEsdl2GngDaDZhzSdn38mpIj2ZlwEuezWqg9riXTZVM
cmyqeoiHv9n3FI9mMgQnKPe5wTIp8UpjyaZzZramwpNEB5Lj2HLgWbvQKstC5yV0pPG0zdod/2HG
QNLRahGeXElXBlX8rebYuZfOfpq+vHZRWY0c/8o5a7gH0LmbfAdx3H6k5Y5jABl2UrQ43Xey8fEY
sOQ=
=1lnQ
-----END PGP SIGNATURE-----

--m48NLFwvCtEnHMpxxZY0V7XOr3bK954lv--
