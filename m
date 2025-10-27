Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F20C114EF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 21:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BE310E560;
	Mon, 27 Oct 2025 20:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="ZmQyIejH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD3910E568
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 20:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1761595642; x=1762200442; i=deller@gmx.de;
 bh=m0i0pyBw1V3yjMGAY2y+SYum+o2Lnlc5L4lYrTdaxX4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ZmQyIejH0mVxQyrOZrGbt7ih96SGrLCvYELdbMY9q0fC18BN5YH4l3WxLjR+3Vtu
 zkM6hcziGBaZSY7z7pQSiwD9C95sYJAH+QSYiDye+UNU9NarTrH7XtgNuRcmAOWnr
 wvpLl/CWJ4GiH4QWQxoTLk6s7IBpU8Q4+BvodS5oLqmIT4rWwjoQtDxqzN4i77cqi
 t6W1wXf3qQ/SdJCkcLpfRw/5rk2be4e/LoJpAmqes5TBqiZL380UgdegXdTVHlTJS
 vpyxhy2OVHRjjR1VrSjFH6hewosTbLTLGiyAOE6f0YBY4O9yW/pA9QhbMDjqubot+
 RURTFa7ldLO8WY/PMQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.190]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7sHy-1v8VgG1MaA-006QTr; Mon, 27
 Oct 2025 21:07:22 +0100
Message-ID: <6c565f4c-ef05-45f2-9a82-cbba4a11cc07@gmx.de>
Date: Mon, 27 Oct 2025 21:07:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: vga16fb: Request memory region.
To: Javier Garcia <rampxxxx@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org
References: <20251016171845.1397153-1-rampxxxx@gmail.com>
 <CABPJ0vgtpjh2q605TifawiS36qAS+OO_dAnYVGsqd03GSXZp+g@mail.gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <CABPJ0vgtpjh2q605TifawiS36qAS+OO_dAnYVGsqd03GSXZp+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:b1IuJEZj99XhbJl2rdb0Fa4jaPF0nAycbyFfTQ0pFXEUVjVHtdU
 9ExuAxX1DxpQMQqsnjLh1PZGg0e98jfGJxmIrw+OJM1BHXEJe44b30BmyhDxJzwVB1SgSfd
 9K3+VSnQbdkdx8tblqHmvfGSk8KX8x6PuVOvgTqXgdjbAvp5gBBUE37PX0pjjY7CM8EjDP3
 8QBRpfwMJbCnJhgNhooTA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:q/leQzNzAh0=;FVzL3nhUbblYOXmIA9+Bvz5WsXu
 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
 xFFHta9PUJfB9dOQAyxXIE+HPhtb6XGfb7I=
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

On 10/27/25 19:02, Javier Garcia wrote:
> Hi,
>=20
> Helge Deller, any comment on this patch?

Well, it doesn't hurt, as it will not abort (as before) even if the region=
 is occupied.
In that sense, I don't see a problem to add it.

But you are missing to release the memory when the driver is released
via vga16fb_remove.

If you send an updated/fixed patch I will apply it to the fbdev tree
to get some testing.

Helge

 =20
> ---
> Javier Garcia
>=20
>=20
> On Thu, 16 Oct 2025 at 19:18, Javier Garcia <rampxxxx@gmail.com> wrote:
>>
>> This patch reserve and release VGA memory region with `*_mem_region`
>> fn's.
>>
>> This align with Documentation/drm/todo.rst
>> "Request memory regions in all fbdev drivers"
>>
>> I've tested with kernel and qemu both 32bits.
>>
>> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
>> ---
>>
>> When I've run the code always return -EBUSY which makes sense as
>> mem is already requested,`/proc/iomem` shows `000a0000-000bffff : Video=
 RAM area`.
>>
>> I've seen that `cirrusfb` has this kind of code wrapped up with `#if 0`=
, and I
>> wonder if it makes sense to also wrap up with `#if 0`, at least , in
>> that way the code gets commented about expected behavior.
>>
>>
>>   drivers/video/fbdev/vga16fb.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16f=
b.c
>> index eedab14c7d51..f506bf144a97 100644
>> --- a/drivers/video/fbdev/vga16fb.c
>> +++ b/drivers/video/fbdev/vga16fb.c
>> @@ -1319,6 +1319,11 @@ static int vga16fb_probe(struct platform_device =
*dev)
>>          if (ret)
>>                  return ret;
>>
>> +       if (!request_mem_region(vga16fb_fix.smem_start, vga16fb_fix.sme=
m_len,
>> +                               "vga16b")) {
>> +               dev_err(&dev->dev,"vga16b: cannot reserve video memory =
at 0x%lx\n",
>> +                      vga16fb_fix.smem_start);
>> +       }
>>          printk(KERN_DEBUG "vga16fb: initializing\n");
>>          info =3D framebuffer_alloc(sizeof(struct vga16fb_par), &dev->d=
ev);
>>
>> @@ -1398,6 +1403,8 @@ static int vga16fb_probe(struct platform_device *=
dev)
>>    err_ioremap:
>>          framebuffer_release(info);
>>    err_fb_alloc:
>> +       release_mem_region(vga16fb_fix.smem_start,
>> +                   vga16fb_fix.smem_len);
>>          return ret;
>>   }
>>
>> --
>> 2.50.1
>>

