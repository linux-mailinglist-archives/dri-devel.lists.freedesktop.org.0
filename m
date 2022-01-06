Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5705548691C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 18:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A334E10ECB6;
	Thu,  6 Jan 2022 17:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE1210ECB6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 17:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1641491314;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=bZK7FiON7aFlTn4+KT6Qs4aeA451ld2YiGQJ1DzWhhk=;
 b=jEbf1rY75MtKZ8HgMyZuFyBEhw1fgvcj76OECaFbTkGwYuW3APos5BKKLWZeXd9E9F
 GD5UatniUE19F2FNbyslbHqlRY3qhdNJms4g5JSNjN2S0MTvr8le1WommRu/v+zQolj7
 eXg6zL7NFfyvdUSIwtKF4T4DOB8e9D9BnVWQkE0Dz6ZB0vJlDGAY5qn4ECrHs92in5PU
 wDNhk3Jt/N00ojpnHef2Hrw6M8HzpY1Fk9YiMmlQXW8JwlaxVoGxQcXt4NW+r5cnm0Jv
 +LkFTfBYDmc+KFKhPLnWCw6/osrWzSb0bUWxBOam8Y/uNCaofb/1iQf0Yh73ncNPFxHp
 KnEA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NIGH/jrwDuvyQ=="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
 by smtp.strato.de (RZmta 47.37.4 DYNA|AUTH)
 with ESMTPSA id R504e6y06HmX7XH
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 6 Jan 2022 18:48:33 +0100 (CET)
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_67CB0A16-C41F-4B68-AD20-AE7527B657EB"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [Openpvrsgx-devgroup] [PATCH] drm: omapdrm: Fix implicit dma_buf
 fencing
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <e55b3d0f-2217-c949-f166-63ca738b44f6@gmail.com>
Date: Thu, 6 Jan 2022 18:48:32 +0100
Message-Id: <7EFC6230-F3A6-4790-8A8F-9B6D55A45921@goldelico.com>
References: <1641397018-29872-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <0ba4b947-57e0-8a80-68d6-a481d5145ab4@ideasonboard.com>
 <e55b3d0f-2217-c949-f166-63ca738b44f6@gmail.com>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
X-Mailer: Apple Mail (2.3445.104.21)
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
Cc: Carl Philipp Klemm <philipp@uvos.xyz>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, christian.koenig@amd.com,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Apple-Mail=_67CB0A16-C41F-4B68-AD20-AE7527B657EB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Ivo,

> Am 06.01.2022 um 17:26 schrieb Ivaylo Dimitrov =
<ivo.g.dimitrov.75@gmail.com>:
>=20
> Hi,
>=20
> On 6.01.22 =D0=B3. 15:43 =D1=87., Tomi Valkeinen wrote:
>> Hi,
>> On 05/01/2022 17:36, Ivaylo Dimitrov wrote:
>>> Currently omapdrm driver does not initialize dma_buf_export_info =
resv
>>> member, which leads to a new dma_resv being allocated and attached =
to
>>> the exported dma_buf. This leads to the issue that fences created on
>>> dma_buf objects imported by other drivers are ignored by omapdrm, as =
only
>>> fences in gem object resv are waited on. This leads to various =
issues like
>>> displaying incomplete frames.
>>>=20
>>> Fix that by initializing dma_buf resv to the resv of the gem object =
being
>>> exported.
>>>=20
>>> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
>>> ---
>>>   drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>=20
>>> diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c =
b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
>>> index f1f93cabb61e..a111e5c91925 100644
>>> --- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
>>> +++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
>>> @@ -88,6 +88,7 @@ struct dma_buf *omap_gem_prime_export(struct =
drm_gem_object *obj, int flags)
>>>       exp_info.size =3D omap_gem_mmap_size(obj);
>>>       exp_info.flags =3D flags;
>>>       exp_info.priv =3D obj;
>>> +    exp_info.resv =3D obj->resv;
>>>       return drm_gem_dmabuf_export(obj->dev, &exp_info);
>>>   }
>> Thanks! Pushed to drm-misc-next.
>=20
> Thanks,
>=20
> I think lts kernels shall get that fix too, but I have no idea how :) =
.

=
https://01.org/linuxgraphics/gfx-docs/drm/process/stable-kernel-rules.html=
 =
<https://01.org/linuxgraphics/gfx-docs/drm/process/stable-kernel-rules.htm=
l>

so I think you can use Option 2 after it got merged by Linus. I am not =
sure
if timing is good for 5.17-rc series. Anyways it should arrive in ca. 3 =
months
within 5.18-rc.

Maybe there is a "fast lane" I do not know...

BR,
Nikolaus



--Apple-Mail=_67CB0A16-C41F-4B68-AD20-AE7527B657EB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Ivo,<br class=3D""><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D"">Am 06.01.2022 um 17:26 schrieb Ivaylo =
Dimitrov &lt;<a href=3D"mailto:ivo.g.dimitrov.75@gmail.com" =
class=3D"">ivo.g.dimitrov.75@gmail.com</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Hi,<br=
 class=3D""><br class=3D"">On 6.01.22 =D0=B3. 15:43 =D1=87., Tomi =
Valkeinen wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">Hi,<br=
 class=3D"">On 05/01/2022 17:36, Ivaylo Dimitrov wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">Currently omapdrm driver =
does not initialize dma_buf_export_info resv<br class=3D"">member, which =
leads to a new dma_resv being allocated and attached to<br class=3D"">the =
exported dma_buf. This leads to the issue that fences created on<br =
class=3D"">dma_buf objects imported by other drivers are ignored by =
omapdrm, as only<br class=3D"">fences in gem object resv are waited on. =
This leads to various issues like<br class=3D"">displaying incomplete =
frames.<br class=3D""><br class=3D"">Fix that by initializing dma_buf =
resv to the resv of the gem object being<br class=3D"">exported.<br =
class=3D""><br class=3D"">Signed-off-by: Ivaylo Dimitrov &lt;<a =
href=3D"mailto:ivo.g.dimitrov.75@gmail.com" =
class=3D"">ivo.g.dimitrov.75@gmail.com</a>&gt;<br class=3D"">---<br =
class=3D"">&nbsp; drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c | 1 +<br =
class=3D"">&nbsp; 1 file changed, 1 insertion(+)<br class=3D""><br =
class=3D"">diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c =
b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c<br class=3D"">index =
f1f93cabb61e..a111e5c91925 100644<br class=3D"">--- =
a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c<br class=3D"">+++ =
b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c<br class=3D"">@@ -88,6 +88,7 =
@@ struct dma_buf *omap_gem_prime_export(struct drm_gem_object *obj, int =
flags)<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exp_info.size =3D =
omap_gem_mmap_size(obj);<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
exp_info.flags =3D flags;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
exp_info.priv =3D obj;<br class=3D"">+&nbsp;&nbsp;&nbsp; exp_info.resv =3D=
 obj-&gt;resv;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
drm_gem_dmabuf_export(obj-&gt;dev, &amp;exp_info);<br class=3D"">&nbsp; =
}<br class=3D""></blockquote>Thanks! Pushed to drm-misc-next.<br =
class=3D""></blockquote><br class=3D"">Thanks,<br class=3D""><br =
class=3D"">I think lts kernels shall get that fix too, but I have no =
idea how :) .<br class=3D""></div></div></blockquote><div><br =
class=3D""></div><a =
href=3D"https://01.org/linuxgraphics/gfx-docs/drm/process/stable-kernel-ru=
les.html" =
class=3D"">https://01.org/linuxgraphics/gfx-docs/drm/process/stable-kernel=
-rules.html</a></div><div><br class=3D""></div><div>so I think you can =
use Option 2 after it got merged by Linus. I am not sure</div><div>if =
timing is good for 5.17-rc series. Anyways it should arrive in ca. 3 =
months</div><div>within 5.18-rc.</div><div><br class=3D""></div><div>Maybe=
 there is a "fast lane" I do not know...</div><div><br =
class=3D""></div><div>BR,</div><div>Nikolaus</div><div><br =
class=3D""></div><div><br class=3D""></div></body></html>=

--Apple-Mail=_67CB0A16-C41F-4B68-AD20-AE7527B657EB--
