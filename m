Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EE6A43D62
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68C810E633;
	Tue, 25 Feb 2025 11:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Dn1Q95Pb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 74034 seconds by postgrey-1.36 at gabe;
 Tue, 25 Feb 2025 11:22:09 UTC
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D32110E632;
 Tue, 25 Feb 2025 11:22:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C18744213;
 Tue, 25 Feb 2025 11:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740482528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3OxoGQW/kRJUtB8Qz3VUy28/n9V0Il9+Kv1b17NZYT8=;
 b=Dn1Q95Pbzkqv0u3DJZC1rPF/NK7kyTHUrRuLJWzaaBYMw+YB4jzWVXXYOuO078iLBkZy4W
 uN8j6/mkv40RPTubFBR3XNCSzN/R14F2Zy7IY5GosJTfIqBqFpeH7P0Cfc0jw/+gJVmq03
 xAXKMx8/6PHLk6hri5GDN2G11sN/0LF/9P7TI2ZEktC7f4C09gJGH98dYmMhn8ltt59Ug9
 HOE88L1Shnfu7d8prpQe1VJtbo/kpbjCyIJOpIGWC3G5A4oKwI8KhUREIpG9bmX2Jbzeu4
 yobpqkHcHr8q1aaKDs4j5QSkJAPDUZlTPshyD7FB5mK42rUI2iuIsAAhbZa2Eg==
Date: Tue, 25 Feb 2025 12:22:05 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH 02/63] test-dyndbg: fixup CLASSMAP usage error
Message-ID: <77a8fdeb-c906-4cd2-ac42-e6a5d3d9e521@bootlin.com>
Mail-Followup-To: Jim Cromie <jim.cromie@gmail.com>,
 linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org,
 intel-gfx-trybot@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <20250125064619.8305-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250125064619.8305-3-jim.cromie@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeiffduffeivdejgfejheeuudekkedvjeeuffegfefghfffkeelgffgieevudejnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopehjihhmrdgtrhhomhhivgesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsggrrhhonhesrghkrghmrghirdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnr
 dhorhhgpdhrtghpthhtohepuhhkrghsiigssegthhhrohhmihhumhdrohhrghdprhgtphhtthhopehinhhtvghlqdhgfhigqdhtrhihsghotheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheprghmugdqghhfgieslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
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



Le 25/01/2025 à 07:45, Jim Cromie a écrit :
> A more careful reading of logging output from test_dynamic_debug.ko
> reveals:
> 
> lib/test_dynamic_debug.c:103 [test_dynamic_debug]do_cats =pmf "doing categories\n"
> lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
> lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
> lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13
> 
> 107 says: HI is unknown, 105,106 have LOW/MID and MID/HI skew.
> 
> The enum's 1st val (explicitly initialized) was wrong; it must be
> _base, not _base+1 (a DECLARE_DYNDBG_CLASSMAP param).  So the last
> enumeration exceeded the range of mapped class-id's, which triggered
> the "class unknown" report.  I coded in an error, intending to verify
> err detection, then forgot, and missed that it was there.
> 
> So this patch fixes a bad usage of DECLARE_DYNDBG_CLASSMAP(), showing
> that it is too error-prone.  As noted in test-mod comments:
> 
>   * Using the CLASSMAP api:
>   * - classmaps must have corresponding enum
>   * - enum symbols must match/correlate with class-name strings in the map.
>   * - base must equal enum's 1st value
>   * - multiple maps must set their base to share the 0-62 class_id space !!
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   lib/test_dynamic_debug.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> index 77c2a669b6af..396144cf351b 100644
> --- a/lib/test_dynamic_debug.c
> +++ b/lib/test_dynamic_debug.c
> @@ -75,7 +75,7 @@ DD_SYS_WRAP(disjoint_bits, p);
>   DD_SYS_WRAP(disjoint_bits, T);
>   
>   /* symbolic input, independent bits */
> -enum cat_disjoint_names { LOW = 11, MID, HI };
> +enum cat_disjoint_names { LOW = 10, MID, HI };
>   DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
>   			"LOW", "MID", "HI");
>   DD_SYS_WRAP(disjoint_names, p);

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

