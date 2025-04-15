Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AD8A89969
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 12:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19E510E6F6;
	Tue, 15 Apr 2025 10:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KCq2l9VB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4AD10E6F7;
 Tue, 15 Apr 2025 10:06:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA21F43981;
 Tue, 15 Apr 2025 10:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744711598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gyefS2qsicS2WeYEx2KUc4cRIS7+s7AsX0vNGF7mzds=;
 b=KCq2l9VBizQUOddDZPnf73tnZwzkwcNtQ4r1V5Z4SAlCrpGqEgU6k0a7K6ZqXSwJL48W+7
 JBQHbhUVSNjzWmw0U2tGOUDBBbdv9hsI8+hW0C1S71wi+7nB087zWAFJiEYx2hYM3naTd0
 Ob8HAk5eAK7wm/x1pLLtgEQMrPQ566Izl5DXqBjwqSHq6uSxAT4gTYKuqCIrCz8SsB6Vc4
 ue1O9e0QVZFl22Qo+CO2McXtHa0mG1h6vVN0y5SFGT3WYTZ8uSnA4eyJ6mNz3UqxuIQe4q
 zvAZgpm9TnLT4PrOyxbGqpKbzfk2E9SctAmlUfdX1tGuRXBXSYR6mbm9erWYxQ==
Message-ID: <b21778f9-dd78-495a-80ad-979c6718072f@bootlin.com>
Date: Tue, 15 Apr 2025 12:06:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v3 29/54] docs/dyndbg: add classmap info to howto
To: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 linux-doc@vger.kernel.org
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
 <20250402174156.1246171-30-jim.cromie@gmail.com>
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
In-Reply-To: <20250402174156.1246171-30-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfhuffvvehfjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetfffhtdeigfehffduuedvkeefgfdvuddugfffteetffdvteffgfejvedugffgffenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepjhhimhdrtghrohhmihgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgsrghrohhnsegrkhgrmhgrihdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehukhgrshiisgestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtoheplhhin
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
> Describe the 3 API macros providing dynamic_debug's classmaps
> 
> DYNDBG_CLASSMAP_DEFINE - create & export a classmap
> DYNDBG_CLASSMAP_USE    - refer to exported map
> DYNDBG_CLASSMAP_PARAM  - bind control param to the classmap
> DYNDBG_CLASSMAP_PARAM_REF + use module's storage - __drm_debug
> 
> TBD: some of this might be over-specification, or just over-talked.
> 
> NB: The _DEFINE & _USE model makes the user dependent on the definer,
> just like EXPORT_SYMBOL(__drm_debug) already does.
> 
> cc: linux-doc@vger.kernel.org
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> v3- rework protection around PARAM
> 
> v0.5 adjustments per Randy Dunlap
> v0.7 checkpatch fixes
> v0.8 more
> v0.9 rewords
> 
> fixup-howto
> ---
>   .../admin-guide/dynamic-debug-howto.rst       | 93 +++++++++++++++++++
>   1 file changed, 93 insertions(+)
> 
> diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
> index 1ceadf4f28f9..5eb4ae3b2f27 100644
> --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> @@ -394,3 +394,96 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
>   For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
>   its ``prefix_str`` argument, if it is constant string; or ``hexdump``
>   in case ``prefix_str`` is built dynamically.
> +
> +Dynamic Debug classmaps
> +=======================
> +
> +The "class" keyword selects prdbgs based on author supplied,
> +domain-oriented names.  This complements the nested-scope keywords:
> +module, file, function, line.
> +
> +The main difference from the others: classes must be named to be
> +changed.  This protects them from generic overwrite:
> +
> +  # IOW this cannot undo any DRM.debug settings
> +  :#> ddcmd -p

Can you also clarify this in the Controlling dynamic debug Behaviour? At 
least something like "Some printk may not be affected by >control 
because of classmaps, see Dynamic Debug classmaps for more information".

Or maybe integrate this section just after/inside Controlling dynamic 
debug Behaviour. So a user is not surprised if his command does not have 
the expected effect.

> +
> +This protection is needed in order to honor the ABI, settings done
> +there must be respected:
> +
> +  :#> echo 0x1ff > /sys/module/drm/parameters/debug
> +
> +So each class must be enabled individually (no wildcards):
> +
> +  :#> ddcmd class DRM_UT_CORE +p
> +  :#> ddcmd class DRM_UT_KMS +p
> +  # or more selectively
> +  :#> ddcmd class DRM_UT_CORE module drm +p
> +
> +That makes direct >control wordy and annoying, but it is a secondary
> +interface; it is not intended to replace the ABI, just slide in
> +underneath and reimplement it.
> +
> +However, since the param is the ABI, if a classmap DEFINEr doesn't
> +also add a _CLASSMAP_PARAM, there is no ABI, and no protection is
> +needed.  In that case, class'd prdbgs would be enabled/disabled by
> +legacy (class-less) queries.

Very clear, thanks!

> +
> +Dynamic Debug Classmap API
> +==========================
> +
> +DRM.debug is built upon:
> +  ABI in /sys/module/drm/parameters/debug
> +      the bits set all DRM_UT_* together
> +  ~23 categorized api macros: drm_dbg_<T>()
> +      all calling drm_{,dev}dbg(DRM_UT_*, ....)
> +  ~5000 calls to the api macros across drivers/gpu/drm/*
> +
> +The const short ints are good for optimizing compilers; a primary
> +classmaps design goal was to preserve those opporunities for
> +optimization.  So basically .classid === category.
> +
> +Then we use the drm_categories DRM_UT_* enum for both the classnames
> +(stringified enum symbols) and their numeric values.
> +
> +Its expected that future users will also use an enum-defined
> +categorization scheme like DRM's, and dyndbg can be adapted under them
> +similarly.
> +
> +DYNAMIC_DEBUG_CLASSMAP_DEFINE(var,type,_base,classnames) - this maps
> +classnames (a list of strings) onto class-ids consecutively, starting
> +at _base, it also maps the names onto CLASSMAP_PARAM bits 0..N.
> +
> +DYNAMIC_DEBUG_CLASSMAP_USE(var) - modules call this to refer to the
> +var _DEFINEd elsewhere (and exported).
> +
> +Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
> +dyndbg to update those classes.  "class FOO" queries are validated
> +against the classes, this finds the classid to alter; classes are not
> +directly selectable by their classid.
> +
> +There are 2 types of classmaps:
> +
> + DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like DRM.debug
> + DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
> +
> +DYNAMIC_DEBUG_CLASSMAP_PARAM - modelled after module_param_cb, it
> +refers to a DEFINEd classmap, and associates it to the param's
> +data-store.  This state is then applied to DEFINEr and USEr modules
> +when they're modprobed.
> +
> +The PARAM interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
> +amongst the contained classnames; all classes are independent in the
> +control parser itself; there is no implied meaning in names like "V4".
> +
> +Modules or module-groups (drm & drivers) can define multiple
> +classmaps, as long as they (all the classmaps) share the limited 0..62
> +per-module-group _class_id range, without overlap.  If a module
> +encounters a conflict between 2 classmaps its USEing, we can extend
> +the _USE macro with an offset to allow avoiding the conflicting range.
> +
> +``#define DEBUG`` will enable all pr_debugs in scope, including any
> +class'd ones.  This won't be reflected in the PARAM readback value,
> +but the class'd pr_debug callsites can be forced off by toggling the
> +classmap-kparam all-on then all-off.

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


