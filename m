Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C04EB47830
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B434A10E433;
	Sat,  6 Sep 2025 22:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="09hOIOX2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="seVV7Dk8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wR5w0oX6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MdYArPsl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65E410E250
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 13:20:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8AB963501D;
 Thu,  4 Sep 2025 13:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756992024; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DDTjsV6n7RK+KAW3ImlmTnmL6rU8xihZpBDmnfyG9vw=;
 b=09hOIOX2YArXbJ4noJa7LCVuK0V5IsN/xT6u4EVOi1awg1ARzXPqnVP5Xx+a2/5cEKGoX1
 URBSx1sOH/DKvQ7THJvfeYzc1SxubP25z11X4YSwBKpXfsl6306m1lPXQCcdOOYrdxqJ8n
 /PxIc1fQbms0E+4nSnL4h8jtXfAktxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756992024;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DDTjsV6n7RK+KAW3ImlmTnmL6rU8xihZpBDmnfyG9vw=;
 b=seVV7Dk86VKE92TMlzMvWtzESGghKUMDLoS+vX4Pt30eBCPiqD+wvAB5YCEo+jY1LpOq6Z
 Sn6Nsrya/SQTDiBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756992023; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DDTjsV6n7RK+KAW3ImlmTnmL6rU8xihZpBDmnfyG9vw=;
 b=wR5w0oX66cPYsHQi01jv/MZ389nHs/3eMkNssE0kuR39l2PrKx+F6+FdWxXM2X3ZbH9OBF
 8NIeGv40ovrfxs0U/zCAbSeNiwOWY7HwbAi3UHQxV/rzlEi5owi9XY/6QvDdqGeYK4rEHY
 Zd5R3y+bhWuvO4v04YcP2bcy8QylXUs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756992023;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DDTjsV6n7RK+KAW3ImlmTnmL6rU8xihZpBDmnfyG9vw=;
 b=MdYArPsleN6s4f/Umcny/pSe0NGJBeY3BJaPzyP4i8BpajeCcoP0slwWm1p39J9YAdNJKb
 jBk3m6oKktueW7Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C21613AA0;
 Thu,  4 Sep 2025 13:20:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id b03LHReSuWiqZAAAD6G6ig
 (envelope-from <wfrisch@suse.de>); Thu, 04 Sep 2025 13:20:23 +0000
Message-ID: <01426301-990d-4cd2-a6a4-330f1bd20291@suse.de>
Date: Thu, 4 Sep 2025 15:20:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.16.y] Revert "drm/dp: Change AUX DPCD probe address from
 DPCD_REV to LANE0_1_STATUS"
To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
References: <20250828174932.414566-1-imre.deak@intel.com>
 <20250828174932.414566-7-imre.deak@intel.com>
 <c9355591-0664-4c28-83c6-97eb2aa32982@suse.de> <aLcXufMj5C9FPqmC@ideak-desk>
Content-Language: en-US
From: Wolfgang Frisch <wfrisch@suse.de>
Autocrypt: addr=wfrisch@suse.de; keydata=
 xsFNBF0Is3wBEADBA78j4c9RzixUcaFc4R/soS4hW1EQnbFk0N9tGsrcZCgjcO6lKIlq835M
 LuHp/XAwE1Up9PVfGjf4jSsG0Qqnw4LYwU4WB9NCsy2PkI2hh3ILdDaV2cQ/VvTbIYskbg/4
 qkMzf0Lw1pauODGGw3MDKR5IMfKdHFlI1vzNNLyHNWobP36cTbGE31Ti2daD5VT9ihNtR8O3
 9X/Jf5AHJlrVin4mAHarCwQJsgYEbxIxsP3jQAHoc1XNNWRRNJgBHzTNqNclkUGQYmCGgWpo
 1LUCIM2FejdKRgqOHTJGr4X5+7Dv3M5ASI28KLqC+QYQTBBt0tkfSzx1E+eIljDRwWbBhN2k
 P9oAsZrIRo38PmN20pREWWrUR8A40Zj6ILvDO8KoONa1qoEuvQ8Jw20hUr4Gb/8UA45CdHYK
 Hf/7Fiq5fQ7m+XNdJRTdM3Vi8O7uTtgQRH11fBr8UGNCJOhBKafcdsv4OUMhUSyWjtZ54KZT
 iGjci/wvgwt4gyP8p74pkSNL8/rw3YlE+CbrTTh1HkZEk5v6Zy47W60308fX3g9ETiwkkGWm
 QaA5m8KLQ8DW0+XcK6B626f5vDq9lKNJx2JgNGWEvenzLyX04gv4U3l1PICYZrcpvIADONUb
 c4cghMnL3C6kiuAURPx4mfX7GW9hFkzpqPtHEyQMNw2tLtLagwARAQABzSFXb2xmZ2FuZyBG
 cmlzY2ggPHdmcmlzY2hAc3VzZS5kZT7CwZQEEwEIAD4CGy8FCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AWIQSi5rfUU+lUT7wT0mvZs1a9TUotFQUCaJB+xgUJD0o4JAAKCRDZs1a9TUotFapB
 D/9ft5zPMYWGOvfGW1y/FQ7NaViO6HglriKDt5LRjAavLuJWr8hBvr3wvL3Di1JhoYY2GoIJ
 9t0AZW5yU9dxUOBMvZyDTvv/PNxp49m7lFWg42BgKZpu5iUxvnsbqkPons/oF+PyrVybPyEv
 12Cg/Zmz6RlNWKKRnSMrZs9M1V2+fVlu1OpL5f8YBU7TPbYUsPdwqdXsImITTM70plbs8nVz
 FulrH6bP4Do6da1SBeKzxOgiuj/hcAR8atuUbyZyJ20NS1LT/UkkC2YE+P+NNJd7f/Gn87Ts
 5MhyPc+1mpXTlDRp7kUqER9TWgv38fcijlkvEWdIvAg7u3caFAoeOL4ytob5OnA2PFgjSeyu
 pwSiiNw0FjMTigtvLm2bG29Xa0g/TPsu1CYAhaNDJs5zbKEMXZBLpI+p2T3yelJYsTR7OPfp
 jbhK9hY0ylw0zJqZzmH0ZLoTl42iyD3RIFVaAFZiGbkTNywJ65gZQl2L8OMsjgffZzccOaLG
 lr0qYq74wmd8wF47EPSllZc8E55FnsafwBmPeuu3Hn5nYXLe6i1Hfv6wzHmmFzDwfMUBhEpd
 YZcmpAfKNBLS8lt/Rj1E+D2PRGq2TBxeOva6VPAk8VLj0t+qNr12x4hU0Ck1uXLtZwqMaMNf
 7mlmLlUo3fJaIvmOWoqHccGTm6M2b800sWJ81s7BTQRdCLN8ARAAz1g4q5qWXX3lN7Bu/xk3
 4PaOV65MguY6MNnkJdPSrOMUBxwtdilX5WkvoqRtbyNlcyK2d6m/5g0Xi8kMfWlB5z1qmbJl
 Y9rirBf8ZD/0nBnIkWE9xyj7PAQ2l+FsFlF0mO+M7+4S8F1xL/21pxxp8hHBQteuYrbtkVj8
 aCh2epmanLLpC1nAL0RGAJLgiviD5RWgwToTdKwo7ciTVaflDzjX/n+WLqxf90bknJwxnEX+
 j2JYlVr4jXh0nCI3PsOJ5AuNfC3pqiXkpMNGIcl37PQoap234bquExsXj6cKWV/CEzcNyI6e
 +94shcdeA7OHiw+GHd4jwLgMn2GIgC+QnY0keEsp+EVyZRYpFQRgcPiA5LOdPbeni+1O+CbW
 bHQcUWHjhdijO+zrnfbKLfApTXDqMxWB8Uflk31VK0ju8HcG6Ehtn6pHuDziKpEWAtcapVln
 OXJv8NJ529H/IODYOmIV6KJfjmopaPq1yKTxXdckVRI517n/TVO7bZtl1CoYlivdDHzOuyxy
 k3vNj3SvxEs1zZD/dQJ15OsbbhHXXRosiG3Og/IJTgZH+7QPCVwtOjHXzhlr0hKGLdkaKB5z
 8SUuvR+udTjtEl5D6oiS9LAXtfNtqbIKpESMy9yxuewvxiqLWDqqsFEcIgfgazcq6jTXMeI/
 vZORNGYCNr73MhMAEQEAAcLDsgQYAQgAJgIbLhYhBKLmt9RT6VRPvBPSa9mzVr1NSi0VBQJo
 kH+lBQkPSjMpAkDBdCAEGQEIAB0WIQRioEOmJKn8f/unGuju3baByeXLIwUCXQizfAAKCRDu
 3baByeXLI9rFD/9g6wfBxHXPfX9Imck9ZUaZVM+8L74KmZvy4XbFjW0RAWLcELEW/36KEly9
 pj1p+p1XdsssvItZRbQHMTQPnYKQQuLBbyk/YquoR0/Wo41tjJs04JdEQyF9+DZui+Hnpv+X
 uAxY5OEtIJ6OZhI9NYk0zXy6fEpRB6cCLlAdaPPWezDETNELfaeq1hqH7pMP2/0nvPPqyYDC
 rDJDL2fF52RclW2mcoSpiXSMqSeY618BSsD+rtLZU1aSzPd2MpMflrD1rFIQQD3fo8NEIJuv
 NS0Ua2LW6Y73Squ4ygHk3Bp7cTKAHGb69Jbv+Wma+NUiiYMOTxBesxJ9t+RPPzIoUTWp/Qp4
 Ic2Hi47f1WNW/UJaLcQl1l5yceRIQljTDVUOpU4UjBxjd6Q7kHiBbU6NPIf8zmpf2WhwCn5z
 ULQ9EttwB1pZT3oMwPsPc+Hr7BVU58CcpJh+MECbCR/TMtSqUTnKBvkmyQKICKwqdJdGXdsg
 RBCLVLnTSkDgvl8N2gK4EgF9/wAyEF8V8CPaTkaDEh2t53kFe4XIwwjFjXea3u5W+6NIJCqg
 6yh1ezyHndAjmhBStjeL+/LrePg+NfIHcKv9+VJ1wi0YzRZaRlO/GG8GYgfuD/m5VAgp8YPa
 lc5O7FDuOQuaBwj+h5gEEMxLQOKQxaG+TF3Xr/3hJ6Jtcf2acwkQ2bNWvU1KLRUWiw/+KviB
 DFodhGcWTM3WE7u1ggheyrLgyHGlnAmRbzUDuegX4suo6CcAAIHrgIZF9yCLooQ82OZc6khR
 zKyTQAJZfZZBAcEBJ63LJYkSLamRQ83LkfzgSNlQeoMbD6+5XRTk38wBbNY+1pPTSwS1tpPe
 wZQPjKhbHQi2RQg2bMcEclxyFBcOzRmvrSqpxHvw5F3oZwdbj/pElNXzWse2M4pZgkZLblBL
 U0ZYXhXj+AOfHbU2fsnO7pSJX4mcEx9HW2FXUxxELLHZTjLfTUo7Nbw2eiBZ8oE4D9Hyv19R
 F0MZMsOeCSnB9x32iKpzNNK/6MGyd9OKM0jktho8u9a3iqyvONs71zVmKfV3z2Ln4r5uGg0g
 0aI6ICqEHnalsOE1Gssd6sJ6fFKnZG2v10BpR48FISRZAMlBs+QL7AjF4vjqdc2GUIBQm2zV
 5drq9kWsBIwJPx/28Swb2Nt4HrTow6sOo5R+x0nV1F+1xpPOmdhOqDlKZYp8PybbmPHOqh1a
 sPVJxKJHxLH9XxxdtRYPgF96uhwuybR/RSpGB4vGPPfQsydcQ04Q/uKqwDLtB4USm1DtAY7g
 4h4aTCWo53BVvLydDovJbSPIqcNGDpJuSwEV6jwsDim8LK/yizY9J+FURupm3ScBoEXlYyMM
 yaSeuQSO99ZZudEjkOCl72o0IbwtpYI=
In-Reply-To: <aLcXufMj5C9FPqmC@ideak-desk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MrG1NkAGtz0CkUnsuzbHFa5u"
X-Spamd-Result: default: False [-6.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SIGNED_PGP(-2.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_SHORT(-0.20)[-0.997]; MIME_BASE64_TEXT(0.10)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 MID_RHS_MATCH_FROM(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -6.30
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:10 +0000
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MrG1NkAGtz0CkUnsuzbHFa5u
Content-Type: multipart/mixed; boundary="------------GfkCxEeJPopA1FkGARzBlZrS";
 protected-headers="v1"
From: Wolfgang Frisch <wfrisch@suse.de>
To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Message-ID: <01426301-990d-4cd2-a6a4-330f1bd20291@suse.de>
Subject: Re: [PATCH 6.16.y] Revert "drm/dp: Change AUX DPCD probe address from
 DPCD_REV to LANE0_1_STATUS"
References: <20250828174932.414566-1-imre.deak@intel.com>
 <20250828174932.414566-7-imre.deak@intel.com>
 <c9355591-0664-4c28-83c6-97eb2aa32982@suse.de> <aLcXufMj5C9FPqmC@ideak-desk>
In-Reply-To: <aLcXufMj5C9FPqmC@ideak-desk>

--------------GfkCxEeJPopA1FkGARzBlZrS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSW1yZSwNCg0KDQpPbiA5LzIvMjUgNjoxMyBQTSwgSW1yZSBEZWFrIHdyb3RlOg0KPiBU
aGlzIGxvb2tzIGxpa2UgdGhlIGlzc3VlIHRyYWNrZWQgYXQNCj4gaHR0cHM6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL2RybS9hbWQvLS9pc3N1ZXMvNDUwMA0KVGhhbmtzISBJIHdhc24n
dCBhd2FyZSBvZiB0aGF0IGlzc3VlIGJlaW5nIHRyYWNrZWQgYWxyZWFkeS4NCg0KPiBUaGUg
Y29ycmVjdCBzb2x1dGlvbiB0aGVyZSBpcyB0byBkaXNhYmxlIHRoZSBEUENEIHByb2Jpbmcs
IHdoaWNoIEFNRA0KPiBmb2xrcyBhcmUgd29ya2luZyBvbiBhdG0uIFVudGlsIHRoYXQsIGNv
dWxkIHlvdSBnaXZlIGEgZ28gdG8gcGF0Y2ggWzFdDQo+IG9uIHRoZSBhYm92ZSB0aWNrZXQg
ZXF1aXZhbGVudCB0byB0aGlzIHNvbHV0aW9uLCBhcHBseWluZyBvbiB2Ni4xNywgb3INCj4g
dGhlIGF0dGFjaGVkIHBhdGNoIGFjaGlldmluZyB0aGUgc2FtZSBvbiB2Ni4xNi40Pw0KSSBj
YW4gY29uZmlybSB5b3VyIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZSBvbiB2Ni4xNi40Lg0KPiBB
bHNvIGl0IHdvdWxkIGhlbHAgaWYgeW91IGNvdWxkIGFkZCBhIGRtZXNnIGxvZyBvbiB0aGUg
dGlja2V0IHRha2VuDQo+IGFmdGVyIGJvb3Rpbmcgd2l0aCBkcm0uZGVidWc9MHgxMDAgYW5k
IHJlcHJvZHVjaW5nIHRoZSBwcm9ibGVtICh2cy4gdHdvDQo+IG90aGVyIGRybS5kZWJ1Zz0w
eDEwMCBsb2dzLCBvbmUgd2l0aCB0aGUgYWJvdmUgRFBfVFJBSU5JTkdfUEFUVEVSTl9TRVQN
Cj4gLT4gRFBfTEFORTBfMV9TVEFUVVMgY2hhbmdlIGFuZCBhbm90aGVyIG9uZSB3aXRoIERQ
Q0QgcHJvYmluZyBkaXNhYmxlZA0KPiBhcyBJIHJlcXVlc3RlZCBhYm92ZSwgdGFrZW4gYWZ0
ZXIgYm9vdGluZyB1cCBhbmQgY29ubmVjdGluZyB0aGUNCj4gZG9jay9tb25pdG9yKS4NCkRv
bmUuIEkgYXR0YWNoZWQgMyBkbWVzZyBsb2dzIHRvIHRoZSB0aWNrZXQ6DQoNCi0gR09PRDog
TGludXggNi4xNi40IHdpdGggRFBDRCBwcm9iaW5nIGRpc2FibGVkDQotIEJBRDogTGludXgg
Ni4xNy4wLXJjNA0KLSBHT09EOiBMaW51eCA2LjE3LjAtcmM0IHdpdGggdGhlIHByb2JlIGFk
ZHJlc3Mgc2V0IHRvIERQX0xBTkUwXzFfU1RBVFVTDQoNCg0KUmVnYXJkcywNCg0KLS0gDQpX
b2xmZ2FuZyBGcmlzY2ggPHdvbGZnYW5nLmZyaXNjaEBzdXNlLmNvbT4NClNlY3VyaXR5IEVu
Z2luZWVyDQpPcGVuUEdQIGZpbmdlcnByaW50OiBBMkU2IEI3RDQgNTNFOSA1NDRGIEJDMTMg
IEQyNkIgRDlCMyA1NkJEIDRENEEgMkQxNQ0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJILCBGcmFua2Vuc3RyYcOfZSAxNDYsIDkwNDYxIE7DvHJuYmVyZw0KDQo=

--------------GfkCxEeJPopA1FkGARzBlZrS--

--------------MrG1NkAGtz0CkUnsuzbHFa5u
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEYqBDpiSp/H/7pxro7t22gcnlyyMFAmi5khcFAwAAAAAACgkQ7t22gcnlyyOZ
BA/+NRWp+YBuQnG0vPzZET+uAnJ1mnb0XxvzKr9q1vQH7kWzggaeLMD5IHuR+GQ8XnieA7iwnWA3
iXsRiFdhWBnFoMFH+tq5qGSP7WpMK0hOuSWoLyGPqCAE1tfHMMoWW09cG+6J1qGDAxdwvnOLuWxA
/ajsxBT+tCjjMZ3cCvP7P1IpHZviu/wrn/ed2GgQwli2w6FSVDBfcedEgT+9AVEvs+E3fYlbk+eI
aSaJEbcVSRanENCrJhiV+lSJFizjZ7pvlu4LVXKrXMOAqHu4B1o+gIQ58Bi3yp6SXho4JG7nScF6
swE+HKGTX3nZlfp2Ag7ekZohGVLeKpsMAeNGWm/px7Fh9hgDgzkDCdDM4ws1xpzfh005n4RQjd2N
7A/bGQEnakTAdmMhuSUA7FpHgB/TA3RWGF2vZVP7J5r9SDYRz/cYB2/3zFdP1JD1mDRKOYi27452
yyq04gPgYvmxcByj9An4rCi6kM/YKFfLlY1nbiNqeDzEKwk+seSU/mIpr0Udb7JAvi7cYVF64PDt
YR5e/P4zXdVJ82rXRcnfB+RpON/c+GXVY1adk/apOnOt+JVPSsOlL6XWug/rx3nPPMAI0bY24u5X
1XDHHoHwPEYFFWa37TZ6EBNWFq7mGPJ0f+6n6Y4e+yelJ1Plv4bSQGZQ1PFf1eVPkvq5bw2tFrZQ
qxk=
=hy7Z
-----END PGP SIGNATURE-----

--------------MrG1NkAGtz0CkUnsuzbHFa5u--
