Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE07CDF838
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 11:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4251B10E180;
	Sat, 27 Dec 2025 10:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pobox.com header.i=@pobox.com header.b="Zg0+jlGm";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q8StG5Kj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 415 seconds by postgrey-1.36 at gabe;
 Sat, 27 Dec 2025 02:11:05 UTC
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792E411ACF2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 02:11:05 +0000 (UTC)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
 by mailfout.stl.internal (Postfix) with ESMTP id AF7651D0008B;
 Fri, 26 Dec 2025 21:04:08 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-07.internal (MEProxy); Fri, 26 Dec 2025 21:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1766801048;
 x=1766887448; bh=tgzq7aqIelvxwGVA4/Ncej1leWSQ/WYlMocARO/cjnY=; b=
 Zg0+jlGmb+IivWheP1XggnMrWvlMxgVYjmVwTJxjEYLxN1qHliHaZe4kYu8uXc6s
 7A800l+/hJ4Zl27mW3PjpPLlETrtl/tCUO7XCx2/W71Rxl6Sj1GyHvxfA6r9D5dR
 LQtdiMBgb1haaa9eeQjnbZpH+IAYBeIyzyP1toyxDtnFS9+f/04aJ2o0hTRGf1q7
 BIKZ9ju/OYntxAvkX+vWzNQmc0dDmGIJEUl4Lo4H7huAu1sN0ItYN5po+FhiMls/
 bCv0K31EY7NCsUbTHJWgHX7NMm4WsrU+LV53MkNuI2KxzK+8d7aMXLY/rkRTLbKO
 mYPpS7F0Ttlg8N9zi9ZEhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766801048; x=
 1766887448; bh=tgzq7aqIelvxwGVA4/Ncej1leWSQ/WYlMocARO/cjnY=; b=Q
 8StG5Kj3CgKGHEktXv9WnwH1O6E8T5r7pfhplXpQUL+dl6d0/BEqjfRnakExfZOs
 J2aQpZKKO2pzGR3lJYEGeu/v0M+qU0bH1d22A7PIjERBrU0OcIC8mXhJW8JP9cYV
 DNyWrur6PT5cvgc+T8g5Ask7r69LqkpS9SyndhZCia9Otgq6h7oloP6V8eC5Qwfq
 1xwYB5JO0ytv3Wz75m7KVxBlB2mw7W3CL9PkscOp2vehVVp3V8aDQZ+3Ghz/WnkD
 dSBJ1vJBHoKhZ1xdwQoGXZCgPHXsHKT+wgEW9NOgHbpX+xqESeXMMKSOpnv8IWJI
 vPsseHDnDpyl5iqzTMbcA==
X-ME-Sender: <xms:lj5PaaTU0rNbH1iIaF3f9KWZV19w_Vutlu3aAbQFej_mBtmQtvuf5A>
 <xme:lj5PaQtgOHdi4nIb6_GIXA0E-xmZy34xq9ym0jofFDOtV6HKCUJQYkksGYg1Qtuhg
 yRFZTpSa_mlctqQ1x12TJPunbtgnfG7sH2qsubOl_9r0LHkaafyqKw>
X-ME-Received: <xmr:lj5PaYLMG1w9LyDDjeNebN71_D76T-sx3KH9O5Y_u7zxwiG5KLy5VFQPx_Fbe3TCLivGMOaTwF7swYsvz4-DkKs-KgTsVpP3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejtddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefkffggfgfhuffvvehfjggtgfesthejredttddvjeenucfhrhhomhepfdeurghrrhih
 ucfmrdcupfgrthhhrghnfdcuoegsrghrrhihnhesphhosghogidrtghomheqnecuggftrf
 grthhtvghrnhepjeehveeitdevteeujeekjeffudeifeffledttdejudetieejudefleei
 uedtheejnecuffhomhgrihhnpehshiiikhgrlhhlvghrrdgrphhpshhpohhtrdgtohhmpd
 hkvghrnhgvlhdrohhrghdpvdegjedrrghtnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepsggrrhhrhihnsehpohgsohigrdgtohhmpdhnsggprh
 gtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepvhhtsegrlhht
 lhhinhhugidrohhrghdprhgtphhtthhopehjuhhnjhhivgdrtggrohesihhnthgvlhdrtg
 homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
 ohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
 ephigvphgvihhlihhnrdgtshesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgv
 lhdrvhgvthhtvghrsehffhiflhhlrdgthhdprhgtphhtthhopehshihoshhhihgurgesrh
 gvughhrghtrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgt
 phhtthhopeguvghllhgvrhesghhmgidruggv
X-ME-Proxy: <xmx:lj5PaUep7CLwjJ_LPx_zSW8J5idb52cIHVaXuaQahgqRh1ZNvzoPbQ>
 <xmx:lj5PaaV_Q9hbxhSGyiFWk6mZMBI9FVVSAz1Urys5NQX5vv8BjAu9JQ>
 <xmx:lj5PaShWzMS41iQaD1n8gir5HiMgkA5s5BVMoXoMIBqPaMVZ_v0WCA>
 <xmx:lj5PaUg7KkBD5lwcmjP8Bh_21WER4eCSnNccdNFanbWxug4_6RTwyA>
 <xmx:mD5PaYQbvyaLqNGZLULMgroHBRYQlHvYCd2nIONj2Vwr4eLnNV9N_O65>
Feedback-ID: i6289494f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Dec 2025 21:04:05 -0500 (EST)
Message-ID: <ccbbf777-cf4e-4c66-856e-282dd9d61970@pobox.com>
Date: Fri, 26 Dec 2025 18:04:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Barry K. Nathan" <barryn@pobox.com>
Subject: Re: [PATCH v2] fbdev: bitblit: bound-check glyph index in bit_putcs*
To: Vitaly Chikunov <vt@altlinux.org>, Junjie Cao <junjie.cao@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peilin Ye <yepeilin.cs@gmail.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Shigeru Yoshida <syoshida@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Zsolt Kajtar <soci@c64.rulez.org>,
 Albin Babu Varghese <albinbabuvarghese20@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 regressions@lists.linux.dev
References: <20251020134701.84082-1-junjie.cao@intel.com>
 <aU23brU4lZqIkw4Z@altlinux.org> <aU58SeZZPxScVPad@altlinux.org>
Content-Language: en-US
In-Reply-To: <aU58SeZZPxScVPad@altlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 27 Dec 2025 10:54:48 +0000
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

On 12/26/25 4:21 AM, Vitaly Chikunov wrote:
> Dear linux-fbdev, stable,
> 
> On Fri, Dec 26, 2025 at 01:29:13AM +0300, Vitaly Chikunov wrote:
>>
>> On Mon, Oct 20, 2025 at 09:47:01PM +0800, Junjie Cao wrote:
>>> bit_putcs_aligned()/unaligned() derived the glyph pointer from the
>>> character value masked by 0xff/0x1ff, which may exceed the actual font's
>>> glyph count and read past the end of the built-in font array.
>>> Clamp the index to the actual glyph count before computing the address.
>>>
>>> This fixes a global out-of-bounds read reported by syzbot.
>>>
>>> Reported-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>>> Closes: https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
>>> Tested-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>>> Signed-off-by: Junjie Cao <junjie.cao@intel.com>
>>
>> This commit is applied to v5.10.247 and causes a regression: when
>> switching VT with ctrl-alt-f2 the screen is blank or completely filled
>> with angle characters, then new text is not appearing (or not visible).
>>
>> This commit is found with git bisect from v5.10.246 to v5.10.247:
>>
>>    0998a6cb232674408a03e8561dc15aa266b2f53b is the first bad commit
>>    commit 0998a6cb232674408a03e8561dc15aa266b2f53b
>>    Author:     Junjie Cao <junjie.cao@intel.com>
>>    AuthorDate: 2025-10-20 21:47:01 +0800
>>    Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>    CommitDate: 2025-12-07 06:08:07 +0900
>>
>>        fbdev: bitblit: bound-check glyph index in bit_putcs*
>>
>>        commit 18c4ef4e765a798b47980555ed665d78b71aeadf upstream.
>>
>>        bit_putcs_aligned()/unaligned() derived the glyph pointer from the
>>        character value masked by 0xff/0x1ff, which may exceed the actual font's
>>        glyph count and read past the end of the built-in font array.
>>        Clamp the index to the actual glyph count before computing the address.
>>
>>        This fixes a global out-of-bounds read reported by syzbot.
>>
>>        Reported-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>>        Closes: https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
>>        Tested-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>>        Signed-off-by: Junjie Cao <junjie.cao@intel.com>
>>        Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>        Signed-off-by: Helge Deller <deller@gmx.de>
>>        Cc: stable@vger.kernel.org
>>        Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>
>>     drivers/video/fbdev/core/bitblit.c | 16 ++++++++++++----
>>     1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> The minimal reproducer in cli, after kernel is booted:
>>
>>    date >/dev/tty2; chvt 2
>>
>> and the date does not appear.
>>
>> Thanks,
>>
>> #regzbot introduced: 0998a6cb232674408a03e8561dc15aa266b2f53b
>>
>>> ---
>>> v1: https://lore.kernel.org/linux-fbdev/5d237d1a-a528-4205-a4d8-71709134f1e1@suse.de/
>>> v1 -> v2:
>>>   - Fix indentation and add blank line after declarations with the .pl helper
>>>   - No functional changes
>>>
>>>   drivers/video/fbdev/core/bitblit.c | 16 ++++++++++++----
>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
>>> index 9d2e59796c3e..085ffb44c51a 100644
>>> --- a/drivers/video/fbdev/core/bitblit.c
>>> +++ b/drivers/video/fbdev/core/bitblit.c
>>> @@ -79,12 +79,16 @@ static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
>>>   				     struct fb_image *image, u8 *buf, u8 *dst)
>>>   {
>>>   	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
>>> +	unsigned int charcnt = vc->vc_font.charcount;
> 
> Perhaps, vc->vc_font.charcount (which is relied upon in the following
> comparison) is not always set correctly in v5.10.247. At least two
> commits that set vc_font.charcount are missing from v5.10.247:
> 
>    a1ac250a82a5 ("fbcon: Avoid using FNTCHARCNT() and hard-coded built-in font charcount")
>    a5a923038d70 ("fbdev: fbcon: Properly revert changes when vc_resize() failed")
> 
> Thanks,

I was just about to report this.

I found two ways to fix this bug. One is to revert this patch; the other 
is to apply the following 3 patches, which are already present in 5.11 
and later:

7a089ec7d77fe7d50f6bb7b178fa25eec9fd822b
     console: Delete unused con_font_copy() callback implementations

4ee573086bd88ff3060dda07873bf755d332e9ba
     Fonts: Add charcount field to font_desc

a1ac250a82a5e97db71f14101ff7468291a6aaef
     fbcon: Avoid using FNTCHARCNT() and hard-coded built-in font
     charcount

(Oh, by the way, this same regression also affects 5.4.302, and the same 
3 patches fix the regression on 5.4 as well, once you manually fix merge 
conflicts. Maybe it would be better to backport other additional commits 
instead of fixing the merge conflicts manually, but since 5.4 is now EOL 
I didn't dig that deep.)

Once these 3 patches are applied, I wonder if a5a923038d70 now becomes 
necessary for 5.10.y. For what it's worth, it applies fine and the 
resulting kernel seems to run OK in brief testing.

-- 
-Barry K. Nathan  <barryn@pobox.com>
