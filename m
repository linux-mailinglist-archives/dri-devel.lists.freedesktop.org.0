Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1970EA8992C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 12:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3546410E6D7;
	Tue, 15 Apr 2025 10:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YdbUchAL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5391810E6D3;
 Tue, 15 Apr 2025 10:00:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9743A1FCE9;
 Tue, 15 Apr 2025 10:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744711252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BO/ApXrHZNI9hpjQrM+/qLBJW7KH50MXXj2Up/W/qyg=;
 b=YdbUchALu2wkBt4rABJcJZ4dCux412f3p5Up5jQlEcy8r54PlY2kbVFj+x/nZoLD+OpB1B
 /gSl4l/ObL7JAZrhL0SEhJVX3TEQyhehaRjlY3W2qlzQGoV9cEQZIaeohvWFre9qC/9s2j
 3gMUx3wVk9vBkjEphgWyX2/LcUJ3U6xIw+JJ73q+Mj2HkQI/qPq61JZSeZyQiEu31yjCi+
 KckKoastlyHa4Jn0WTWr15REHydCXz+Vbxbe6db52MCT8YllM1ywpXSKOpXvacr3cYzHKc
 seVYeAcPd1jDjKDsLHPFtfstEA8PI8YGKgAbF+4QWiywWeXaUDysY6q3SzqAGQ==
Message-ID: <8febdf91-b2dd-456a-bc6c-b6a4512e5aae@bootlin.com>
Date: Tue, 15 Apr 2025 12:00:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v3 16/54] dyndbg-API: remove
 DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
To: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
 <20250402174156.1246171-17-jim.cromie@gmail.com>
Content-Language: en-US
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 xsFNBGCG5KEBEAD1yQ5C7eS4rxD0Wj7JRYZ07UhWTbBpbSjHjYJQWx/qupQdzzxe6sdrxYSY
 5K81kIWbtQX91pD/wH5UapRF4kwMXTAqof8+m3XfYcEDVG31Kf8QkJTG/gLBi1UfJgGBahbY
 hjP40kuUR/mr7M7bKoBP9Uh0uaEM+DuKl6bSXMSrJ6fOtEPOtnfBY0xVPmqIKfLFEkjh800v
 jD1fdwWKtAIXf+cQtC9QWvcdzAmQIwmyFBmbg+ccqao1OIXTgu+qMAHfgKDjYctESvo+Szmb
 DFBZudPbyTAlf2mVKpoHKMGy3ndPZ19RboKUP0wjrF+Snif6zRFisHK7D/mqpgUftoV4HjEH
 bQO9bTJZXIoPJMSb+Lyds0m83/LYfjcWP8w889bNyD4Lzzzu+hWIu/OObJeGEQqY01etOLMh
 deuSuCG9tFr0DY6l37d4VK4dqq4Snmm87IRCb3AHAEMJ5SsO8WmRYF8ReLIk0tJJPrALv8DD
 lnLnwadBJ9H8djZMj24+GC6MJjN8dDNWctpBXgGZKuCM7Ggaex+RLHP/+14Vl+lSLdFiUb3U
 ljBXuc9v5/9+D8fWlH03q+NCa1dVgUtsP2lpolOV3EE85q1HdMyt5K91oB0hLNFdTFYwn1bW
 WJ2FaRhiC1yV4kn/z8g7fAp57VyIb6lQfS1Wwuj5/53XYjdipQARAQABzSlMb3VpcyBDaGF1
 dmV0IDxsb3Vpcy5jaGF1dmV0QGJvb3RsaW4uY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBItxBK6aJy1mk/Un8uwYg/VeC0ClBQJmlnw+BQkH8MsdAAoJEOwY
 g/VeC0ClyhwP/Ra6H+5F2NEW6/IMVHeXmhuly8CcZ3kyoKeGNowghIcTBo59dFh0atGCvr+y
 K9YD5Pyg9aX4Ropw1R1RVIMrWoUNZUKebRTu6iNHkE6tmURJaKLzR+9la+789jznQvbV+9gM
 YTBppX4/0cWY58jiDiDV4aJ77JDo7aWNK4hz8mZsB+Y7ezMuS4jy2r4b7dZ+YL/T9/k3/emO
 PkAuFkVhkNhytMEyOBsT7SjL4IUBeYWvOw9MIaXEl4qW/5HLGtMuNhS94NsviDXZquoOHOby
 2uuRAI0bLz1qcsnY90yyPlDJ0pMuJHbi0DBzPTIYkyuwoyplfWxnUPp1wfsjiy/B6mRKTbdE
 a/K6jNzdVC1LLjTD4EjwnCE8IZBRWH1NVC1suOkw3Sr1FYcHFSYqNDrrzO+RKtR1JMrIe8/3
 Xhe2/UNUhppsK3SaFaIsu98mVQY3bA/Xn9wYcuAAzRzhEHgrbp8LPzYdi6Qtlqpt4HcPV3Ya
 H9BkCacgyLHcdeQbBXaup9JbF5oqbdtwev3waAmNfhWhrQeqQ0tkrpJ46l9slEGEdao5Dcct
 QDRjmJz7Gx/rKJngQrbboOQz+rhiHPoJc/n75lgOqtHRePNEf9xmtteHYpiAXh/YNooXJvdA
 tgR1jAsCsxuXZnW2DpVClm1WSHNfLSWona8cTkcoSTeYCrnXzsFNBGCG6KUBEADZhvm9TZ25
 JZa7wbKMOpvSH36K8wl74FhuVuv7ykeFPKH2oC7zmP1oqs1IF1UXQQzNkCHsBpIZq+TSE74a
 mG4sEhZP0irrG/w3JQ9Vbxds7PzlQzDarJ1WJvS2KZ4AVnwc/ucirNuxinAuAmmNBUNF8w6o
 Y97sdgFuIZUP6h972Tby5bu7wmy1hWL3+2QV+LEKmRpr0D9jDtJrKfm25sLwoHIojdQtGv2g
 JbQ9Oh9+k3QG9Kh6tiQoOrzgJ9pNjamYsnti9M2XHhlX489eXq/E6bWOBRa0UmD0tuQKNgK1
 n8EDmFPW3L0vEnytAl4QyZEzPhO30GEcgtNkaJVQwiXtn4FMw4R5ncqXVvzR7rnEuXwyO9RF
 tjqhwxsfRlORo6vMKqvDxFfgIkVnlc2KBa563qDNARB6caG6kRaLVcy0pGVlCiHLjl6ygP+G
 GCNfoh/PADQz7gaobN2WZzXbsVS5LDb9w/TqskSRhkgXpxt6k2rqNgdfeyomlkQnruvkIIjs
 Sk2X68nwHJlCjze3IgSngS2Gc0NC/DDoUBMblP6a2LJwuF/nvaW+QzPquy5KjKUO2UqIO9y+
 movZqE777uayqmMeIy4cd/gg/yTBBcGvWVm0Dh7dE6G6WXJUhWIUtXCzxKMmkvSmZy+gt1rN
 OyCd65HgUXPBf+hioCzGVFSoqQARAQABwsOyBBgBCAAmAhsuFiEEi3EErponLWaT9Sfy7BiD
 9V4LQKUFAmaWfGYFCQfwx0ECQAkQ7BiD9V4LQKXBdCAEGQEIAB0WIQRPj7g/vng8MQxQWQQg
 rS7GWxAs4gUCYIbopQAKCRAgrS7GWxAs4gfGEACcA0XVNesbVIyvs5SJpJy+6csrH4yy233o
 GclX2P7pcCls55wiV6ywCtRaXWFjztYmklQieaZ/zq+pUuUDtBZo95rUP20E56gYV2XFB18W
 YeekTwH5d2d/j++60iHExWTB+sgMEv3CEGikUBj7iaMX2KtaB1k9K+3K6dx/s1KWxOClFkbJ
 EV/tmeq7Ta8LiytQM9b4yY550tzC0pEEeFcLFXo1m5KcJauYnAqrlOVY48NFpFUd9oAZf/Pz
 p3oEs+zn/8zK2PBrZZCD6AhrbotRy7irE5eimhxcsFm1+MG5ufnaQUWHrRYXVuFhvkSoqZ8j
 GPgPEpFor4NjRyX/PMLglQ7S5snkvKcr3Lun44aybXEHq/1FTzW2kOh6kFHFFOPbMv1voJKM
 IzrmDoDS+xANt/La7OwpCylCgF6t9oHHTTGfAfwtfYZbiepC66FDe/Jt/QLwkIXeIoeSS1O4
 6rJdGWG2kHthUM+uIbUbaRJW8AkJpzP1Mz7TieR/9jO4YPeUm9tGL5kP2yyNtzFilcoOeox1
 NSFNAPz+zPcovVmxAaSDGcSzhQVJVlk8xPib8g4fnI8qJ3Gj7xyw8D9dzxhCR2DIFmZL84En
 N7Rj+k4VIGY7M/cVvxL81jlbMGMERMmb96Cua9z1ROviGA1He2gbHOcp6qmLNu3nprleG8PL
 ZRNdEAC0iZapoyiXlVCKLFIwUPnxUz5iarqIfQU8sa1VXYYd/AAAFI6Wv3zfNtGicjgHP8rN
 CIegqm2Av1939XXGZJVI9f3hEoUn04rvxCgcDcUvn7I0WTZ4JB9G5qAGvQLXeXK6Byu77qTx
 eC7PUIIEKN3X47e8xTSj2reVTlanDr8yeqZhxpKHaS0laF8RbD85geZtAK67qEByX2KC9DUo
 eHBFuXpYMzGQnf2SG105ePI2f4h5iAfbTW9VWH989fx4f2hVlDwTe08/NhPdwq/Houov9f/+
 uPpYEMlHCNwE8GRV7aEjd/dvu87PQPm4zFtC3jgQaUKCbYYlHmYYRlrLQenX3QSorrQNPbfz
 uQkNLDVcjgD2fxBpemT7EhHYBz+ugsfbtdsH+4jVCo5WLb/HxE6o5zvSIkXknWh1DhFj/qe9
 Zb9PGmfp8T8Ty+c/hjE5x6SrkRCX8qPXIvfSWLlb8M0lpcpFK+tB+kZlu5I3ycQDNLTk3qmf
 PdjUMWb5Ld21PSyCrtGc/hTKwxMoHsOZPy6UB8YJ5omZdsavcjKMrDpybguOfxUmGYs2H3MJ
 ghIUQMMOe0267uQcmMNDPRueGWTLXcuyz0Tpe62Whekc3gNMl0JrNz6Gty8OBb/ETijfSHPE
 qGHYuyAZJo9A/IazHuJ+4n+gm4kQl1WLfxoRMzYHCA==
In-Reply-To: <20250402174156.1246171-17-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfhuffvvehfjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetfffhtdeigfehffduuedvkeefgfdvuddugfffteetffdvteffgfejvedugffgffenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepjhhimhdrtghrohhmihgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgsrghrohhnsegrkhgrmhgrihdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehukhgrshiisgestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtoheplhhin
 hhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrmhguqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepihhnthgvlhdqghhvthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 02/04/2025 à 19:41, Jim Cromie a écrit :
> Remove the DD_CLASS_TYPE_*_NAMES classmap types and code.
> 
> These 2 classmap types accept class names at the PARAM interface, for
> example:
> 
>    echo +DRM_UT_CORE,-DRM_UT_KMS > /sys/module/drm/parameters/debug_names
> 
> The code works, but its only used by test-dynamic-debug, and wasn't
> asked for by anyone else, so reduce LOC & test-surface; simplify things.
> 
> Also rename enum class_map_type to enum ddebug_class_map_type.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   include/linux/dynamic_debug.h |  23 ++------
>   lib/dynamic_debug.c           | 102 +++-------------------------------
>   lib/test_dynamic_debug.c      |  26 ---------
>   3 files changed, 14 insertions(+), 137 deletions(-)
> 
> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> index f4d1d08cd5a7..769f02456c8e 100644
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -58,27 +58,16 @@ struct _ddebug {
>   #endif
>   } __attribute__((aligned(8)));
>   
> -enum class_map_type {
> +enum ddebug_class_map_type {
>   	DD_CLASS_TYPE_DISJOINT_BITS,
>   	/**
> -	 * DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, one per bit.
> -	 * expecting hex input. Built for drm.debug, basis for other types.
> +	 * DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, mapped to bits[0..N].
> +	 * Expects hex input. Built for drm.debug, basis for other types.
>   	 */
>   	DD_CLASS_TYPE_LEVEL_NUM,
>   	/**
> -	 * DD_CLASS_TYPE_LEVEL_NUM: input is numeric level, 0-N.
> -	 * N turns on just bits N-1 .. 0, so N=0 turns all bits off.
> -	 */
> -	DD_CLASS_TYPE_DISJOINT_NAMES,
> -	/**
> -	 * DD_CLASS_TYPE_DISJOINT_NAMES: input is a CSV of [+-]CLASS_NAMES,
> -	 * classes are independent, like _DISJOINT_BITS.
> -	 */
> -	DD_CLASS_TYPE_LEVEL_NAMES,
> -	/**
> -	 * DD_CLASS_TYPE_LEVEL_NAMES: input is a CSV of [+-]CLASS_NAMES,
> -	 * intended for names like: INFO,DEBUG,TRACE, with a module prefix
> -	 * avoid EMERG,ALERT,CRIT,ERR,WARNING: they're not debug
> +	 * DD_CLASS_TYPE_LEVEL_NUM: input is numeric level, 0..N.
> +	 * Input N turns on bits 0..N-1
>   	 */
>   };
>   
> @@ -88,7 +77,7 @@ struct _ddebug_class_map {
>   	const char **class_names;
>   	const int length;
>   	const int base;		/* index of 1st .class_id, allows split/shared space */
> -	enum class_map_type map_type;
> +	enum ddebug_class_map_type map_type;
>   };
>   
>   /**
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index aff254d39c36..a7e1dbb6ead0 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -646,76 +646,6 @@ static int ddebug_apply_class_bitmap(const struct _ddebug_class_param *dcp,
>   
>   #define CLASSMAP_BITMASK(width) ((1UL << (width)) - 1)
>   
> -/* accept comma-separated-list of [+-] classnames */
> -static int param_set_dyndbg_classnames(const char *instr, const struct kernel_param *kp)
> -{
> -	const struct _ddebug_class_param *dcp = kp->arg;
> -	const struct _ddebug_class_map *map = dcp->map;
> -	unsigned long curr_bits, old_bits;
> -	char *cl_str, *p, *tmp;
> -	int cls_id, totct = 0;
> -	bool wanted;
> -
> -	cl_str = tmp = kstrdup_and_replace(instr, '\n', '\0', GFP_KERNEL);
> -	if (!tmp)
> -		return -ENOMEM;
> -
> -	/* start with previously set state-bits, then modify */
> -	curr_bits = old_bits = *dcp->bits;
> -	vpr_info("\"%s\" > %s:0x%lx\n", cl_str, KP_NAME(kp), curr_bits);
> -
> -	for (; cl_str; cl_str = p) {
> -		p = strchr(cl_str, ',');
> -		if (p)
> -			*p++ = '\0';
> -
> -		if (*cl_str == '-') {
> -			wanted = false;
> -			cl_str++;
> -		} else {
> -			wanted = true;
> -			if (*cl_str == '+')
> -				cl_str++;
> -		}
> -		cls_id = match_string(map->class_names, map->length, cl_str);
> -		if (cls_id < 0) {
> -			pr_err("%s unknown to %s\n", cl_str, KP_NAME(kp));
> -			continue;
> -		}
> -
> -		/* have one or more valid class_ids of one *_NAMES type */
> -		switch (map->map_type) {
> -		case DD_CLASS_TYPE_DISJOINT_NAMES:
> -			/* the +/- pertains to a single bit */
> -			if (test_bit(cls_id, &curr_bits) == wanted) {
> -				v3pr_info("no change on %s\n", cl_str);
> -				continue;
> -			}
> -			curr_bits ^= BIT(cls_id);
> -			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, *dcp->bits, NULL);
> -			*dcp->bits = curr_bits;
> -			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
> -				  map->class_names[cls_id]);
> -			break;
> -		case DD_CLASS_TYPE_LEVEL_NAMES:
> -			/* cls_id = N in 0..max. wanted +/- determines N or N-1 */
> -			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
> -			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
> -
> -			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, old_bits, NULL);
> -			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
> -			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
> -				  map->class_names[cls_id], old_bits, curr_bits);
> -			break;
> -		default:
> -			pr_err("illegal map-type value %d\n", map->map_type);
> -		}
> -	}
> -	kfree(tmp);
> -	vpr_info("total matches: %d\n", totct);
> -	return 0;
> -}
> -
>   static int param_set_dyndbg_module_classes(const char *instr,
>   					   const struct kernel_param *kp,
>   					   const char *mod_name)
> @@ -724,29 +654,17 @@ static int param_set_dyndbg_module_classes(const char *instr,
>   	const struct _ddebug_class_map *map = dcp->map;
>   	unsigned long inrep, new_bits, old_bits;
>   	int rc, totct = 0;
> -
> -	switch (map->map_type) {
> -
> -	case DD_CLASS_TYPE_DISJOINT_NAMES:
> -	case DD_CLASS_TYPE_LEVEL_NAMES:
> -		/* handle [+-]classnames list separately, we are done here */
> -		return param_set_dyndbg_classnames(instr, kp);
> -
> -	case DD_CLASS_TYPE_DISJOINT_BITS:
> -	case DD_CLASS_TYPE_LEVEL_NUM:
> -		/* numeric input, accept and fall-thru */
> -		rc = kstrtoul(instr, 0, &inrep);
> -		if (rc) {
> -			pr_err("expecting numeric input: %s > %s\n", instr, KP_NAME(kp));
> -			return -EINVAL;
> -		}
> -		break;
> -	default:
> -		pr_err("%s: bad map type: %d\n", KP_NAME(kp), map->map_type);
> +	char *nl;
> +
> +	rc = kstrtoul(instr, 0, &inrep);
> +	if (rc) {
> +		nl = strchr(instr, '\n');
> +		if (nl)
> +			*nl = '\0';
> +		pr_err("expecting numeric input, not: %s > %s\n", instr, KP_NAME(kp));
>   		return -EINVAL;
>   	}
>   
> -	/* only _BITS,_NUM (numeric) map-types get here */
>   	switch (map->map_type) {
>   	case DD_CLASS_TYPE_DISJOINT_BITS:
>   		/* expect bits. mask and warn if too many */
> @@ -812,12 +730,8 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
>   	const struct _ddebug_class_map *map = dcp->map;
>   
>   	switch (map->map_type) {
> -
> -	case DD_CLASS_TYPE_DISJOINT_NAMES:
>   	case DD_CLASS_TYPE_DISJOINT_BITS:
>   		return scnprintf(buffer, PAGE_SIZE, "0x%lx\n", *dcp->bits);
> -
> -	case DD_CLASS_TYPE_LEVEL_NAMES:
>   	case DD_CLASS_TYPE_LEVEL_NUM:
>   		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
>   	default:
> diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> index 8434f70b51bb..9c3e53cd26bd 100644
> --- a/lib/test_dynamic_debug.c
> +++ b/lib/test_dynamic_debug.c
> @@ -74,13 +74,6 @@ DECLARE_DYNDBG_CLASSMAP(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS, 0,
>   DD_SYS_WRAP(disjoint_bits, p);
>   DD_SYS_WRAP(disjoint_bits, T);
>   
> -/* symbolic input, independent bits */
> -enum cat_disjoint_names { LOW = 10, MID, HI };
> -DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
> -			"LOW", "MID", "HI");
> -DD_SYS_WRAP(disjoint_names, p);
> -DD_SYS_WRAP(disjoint_names, T);
> -
>   /* numeric verbosity, V2 > V1 related */
>   enum cat_level_num { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
>   DECLARE_DYNDBG_CLASSMAP(map_level_num, DD_CLASS_TYPE_LEVEL_NUM, 14,
> @@ -88,13 +81,6 @@ DECLARE_DYNDBG_CLASSMAP(map_level_num, DD_CLASS_TYPE_LEVEL_NUM, 14,
>   DD_SYS_WRAP(level_num, p);
>   DD_SYS_WRAP(level_num, T);
>   
> -/* symbolic verbosity */
> -enum cat_level_names { L0 = 22, L1, L2, L3, L4, L5, L6, L7 };
> -DECLARE_DYNDBG_CLASSMAP(map_level_names, DD_CLASS_TYPE_LEVEL_NAMES, 22,
> -			"L0", "L1", "L2", "L3", "L4", "L5", "L6", "L7");
> -DD_SYS_WRAP(level_names, p);
> -DD_SYS_WRAP(level_names, T);
> -
>   /* stand-in for all pr_debug etc */
>   #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
>   
> @@ -102,10 +88,6 @@ static void do_cats(void)
>   {
>   	pr_debug("doing categories\n");
>   
> -	prdbg(LOW);
> -	prdbg(MID);
> -	prdbg(HI);
> -
>   	prdbg(D2_CORE);
>   	prdbg(D2_DRIVER);
>   	prdbg(D2_KMS);
> @@ -129,14 +111,6 @@ static void do_levels(void)
>   	prdbg(V5);
>   	prdbg(V6);
>   	prdbg(V7);
> -
> -	prdbg(L1);
> -	prdbg(L2);
> -	prdbg(L3);
> -	prdbg(L4);
> -	prdbg(L5);
> -	prdbg(L6);
> -	prdbg(L7);
>   }
>   
>   static void do_prints(void)

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


