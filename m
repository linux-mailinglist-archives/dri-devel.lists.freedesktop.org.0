Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B245A6DE47
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 16:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCF310E46E;
	Mon, 24 Mar 2025 15:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="L6cAO2ED";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EAD10E46B;
 Mon, 24 Mar 2025 15:20:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 748C32047D;
 Mon, 24 Mar 2025 15:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1742829655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RvILZxrp8pvFIByOZLy7p8omSOBu/+zcN1EsYqvLh/w=;
 b=L6cAO2EDDHaB/JvgVrxZRQBH3obmlZdrFFJSzET/EhnRAXUlJ4lUBaMcqo3mm/F/qnyEKt
 8ahU5p1snZy+pkBGPH8RfQrJBMqrPf/xsF8BZBYxWfMcmetJNDzGAGNUqd6uKtWrHqdwBY
 o4Hs3s6OicZ3/P7jRJt+WrI0jf1xCuwIMKsZUt0mHjTmYz2rPQNRK4eqVb+tLPL5bGHDSr
 WZ0guMKtbjUWlPEQ6vAxJn9hig5xoUEoEsLSmVRiLHSkP6iTHKaEgIOziI3mce8avQF1bL
 6NXn/uduLYjV48Fe/ShFAiWnFtuZYDoAmdfX/MGfQlVBLOxsha/wwgV94/4rgA==
Message-ID: <0828cfdb-abf3-42c5-8500-70f36affd0a8@bootlin.com>
Date: Mon, 24 Mar 2025 16:20:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v2 30/59] dyndbg: drop "protection" of class'd pr_debugs
 from legacy queries
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com
References: <20250320185238.447458-1-jim.cromie@gmail.com>
 <20250320185238.447458-31-jim.cromie@gmail.com>
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
In-Reply-To: <20250320185238.447458-31-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedtudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfhuffvvehfjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetfffhtdeigfehffduuedvkeefgfdvuddugfffteetffdvteffgfejvedugffgffenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepjhhimhdrtghrohhmihgvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrmhguqdhgfhigsehlihhsthhsr
 dhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepihhnthgvlhdqghhvthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehinhhtvghlqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepihhnthgvlhdqghhfgidqthhrhigsohhtsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepjhgsrghrohhnsegrkhgrmhgrihdrtghomh
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



Le 20/03/2025 à 19:52, Jim Cromie a écrit :
> Current classmap code protects class'd pr_debugs from unintended
> changes by "legacy" unclassed queries:
> 
>    # this doesn't disable all of DRM_UT_* categories
>    echo "-p" > /proc/dynamic_debug/control
> 
>    # name the class to change it - protective but tedious
>    echo "class DRM_UT_CORE +p" > /proc/dynamic_debug/control
> 
>    # or do it the subsystem way
>    echo 1 > /sys/module/drm/parameters/debug
> 
> This "name the class to change it" behavior gave a modicum of
> protection to classmap users (ie DRM) so their debug settings aren't
> trivially and unintentionally altered underneath them.
> 
> But this made the class keyword special in some sense; the other
> keywords skip only on explicit mismatch, otherwize the code falls thru

s/otherwize/otherwise/

> to adjust the pr-debug site.
> 
> So Jason Baron didn't like this special case when I 1st proposed it;
> I argued 2 points:
> - "protection gives stable-debug, improving utility"
> - __drm_debug is authoritative w/o dyndbg under it.
> 
> I thought I'd convinced him back then, (and the patchset got merged),
> but he noted it again when he reviewed this series.  So this commit
> names the "special case": ddebug_client_module_protects_classes(), and
> reverts it to Jason's preference.
  >
> If a class mismatch is seen, code distinguishes whether the class was
> explicitly given (and always skips/continue), or the DFLT was assumed
> because no class was given.  Here we test
> ddebug_client_module_protects_classes(), skip if so.
> 
> Later, if any user/module wants to protect its classes, we could add a
> flag to ddebug_table, a means to set it from CLASSMAP_DEFINE, and
> check it when applying a classless query/cmd.

I don't really understand the goal of the protection, do you have the 
discussion between you and Jason so I can have some context and some 
answer to my questions?

With the example you gave above, I think this could lead to a very odd 
behavior: if I enable dyndbg, I expect any pr_dbg to be managed by 
dyndbg settings.

If a user writes stuff on dyndbg control, he clearly knows what he is 
doing, and he wants to control what logs he wants.

And if you allow multiple "protected" users, the normal way to disable 
all dyndbg logs will be:

	ddcmd -p
	ddcmd class DRM_UT_CORE -p
	ddcmd class DRM_... -p # all drm classes
	ddcmd class SPI_... -p # all spi classes
	ddcmd class WHATEVER_... -p # all other subsystem

	# And only now you can enable only what you want
	ddcmd module my_mod +p

This is clearly annoying to write.

If DRM (or whatever subsystem) wants to add a debug parameter and use it 
to control their logs without being impacted by dyndbg, I believe it 
should not use dyndbg classes to do it.

> CC: jbaron@akamai.com
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>   lib/dynamic_debug.c | 34 +++++++++++++++++++++++++---------
>   1 file changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index c44502787c2b..13de0dd3a4ad 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -193,6 +193,17 @@ static int ddebug_find_valid_class(struct ddebug_table const *dt, const char *cl
>   	return -ENOENT;
>   }
>   
> +/*
> + * classmaps-v1 protected classes from changes by legacy commands
> + * (those selecting _DPRINTK_CLASS_DFLT by omission), v2 undoes that
> + * special treatment.  State so explicitly.  Later we could give
> + * modules the choice to protect their classes or to keep v2 behavior.
> + */
> +static inline bool ddebug_client_module_protects_classes(const struct ddebug_table *dt)
> +{
> +	return false;
> +}
> +
>   /*
>    * Search the tables for _ddebug's which match the given `query' and
>    * apply the `flags' and `mask' to them.  Returns number of matching
> @@ -206,7 +217,7 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
>   	unsigned int newflags;
>   	unsigned int nfound = 0;
>   	struct flagsbuf fbuf, nbuf;
> -	int valid_class;
> +	int slctd_class;

Nitpick: can you use full words? slctd is difficult to read.

>   
>   	/* search for matching ddebugs */
>   	mutex_lock(&ddebug_lock);
> @@ -218,21 +229,26 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
>   			continue;
>   
>   		if (query->class_string) {
> -			valid_class = ddebug_find_valid_class(dt, query->class_string);
> -			if (valid_class < 0)
> +			slctd_class = ddebug_find_valid_class(dt, query->class_string);
> +			if (slctd_class < 0)
> +				/* skip/reject classes unknown by module */
>   				continue;
>   		} else {
> -			/* constrain query, do not touch class'd callsites */
> -			valid_class = _DPRINTK_CLASS_DFLT;
> +			slctd_class = _DPRINTK_CLASS_DFLT;
>   		}
>   
>   		for (i = 0; i < dt->info.descs.len; i++) {
>   			struct _ddebug *dp = &dt->info.descs.start[i];
>   
> -			/* match site against query-class */
> -			if (dp->class_id != valid_class)
> -				continue;
> -
> +			if (dp->class_id != slctd_class) {
> +				if (query->class_string)
> +					/* site.class != given class */
> +					continue;
> +				/* legacy query, class'd site */
> +				else if (ddebug_client_module_protects_classes(dt))
> +					continue;
> +				/* allow change on class'd pr_debug */
> +			}
>   			/* match against the source filename */
>   			if (query->filename &&
>   			    !match_wildcard(query->filename, dp->filename) &&

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


