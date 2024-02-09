Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4416384F753
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 15:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874AC10F4CE;
	Fri,  9 Feb 2024 14:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="F8yub6xh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 354 seconds by postgrey-1.36 at gabe;
 Fri, 09 Feb 2024 14:31:02 UTC
Received: from ts201-smtpout76.ddc.teliasonera.net
 (ts201-smtpout76.ddc.teliasonera.net [81.236.60.181])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1445910F4CE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 14:31:02 +0000 (UTC)
X-RG-Rigid: 65C1E60F001D68D3
X-Originating-IP: [81.229.72.127]
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvledrtdeigdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfvgffnkfetufghpdggtfgfnhhsuhgsshgtrhhisggvpdfqfgfvnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepvfhhohhmrghsucfjvghllhhsthhrnphmucdlkfhnthgvlhdmuceothhhohhmrghspghoshesshhhihhpmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpeevudffvdeufffgffdtvdeuteffueeivdekhedugefggefgudeikeelgeelieduhfenucfkphepkedurddvvdelrdejvddruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehmrghilhdurdhshhhiphhmrghilhdrohhrghdpihhnvghtpeekuddrvddvledrjedvrdduvdejpdhmrghilhhfrhhomhepthhhohhmrghspghoshesshhhihhpmhgrihhlrdhorhhgpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlsehffhiflhhlrdgthhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgesihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhk
 vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehluhgtihgrnhhordgtohgvlhhhohesihhnthgvlhdrtghomh
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from mail1.shipmail.org (81.229.72.127) by
 ts201-smtpout76.ddc.teliasonera.net (5.8.716)
 id 65C1E60F001D68D3; Fri, 9 Feb 2024 15:24:29 +0100
Received: from [192.168.0.209] (81-229-72-127-no17.tbcn.telia.com
 [81.229.72.127])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 23B343601C2;
 Fri,  9 Feb 2024 15:24:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1707488669; bh=DXr2vtxB5SZsRjIgAqXwHMetUZoBQEkwdE8sv+48QYo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F8yub6xhIMP8Nyqs479EcZBkbGDyqI++9hR1Dw1ygKuZO/Ayu7LOMsjMTznbFQv7r
 ifm8YhtkDQv2KwHHbrAsI0lvI7UO4HC1qWS7/n+VJ0WvdIj2RW6pz0olcsNWb5oqEA
 64XnBb2ceMIMRhPHlaY/XkTAB3qf6OcRGL2uV6/A=
Message-ID: <0df5a370-0f34-4d67-af10-5538e1a8908a@shipmail.org>
Date: Fri, 9 Feb 2024 15:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tests: mm: Convert to drm_dbg_printer
Content-Language: en-US
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>, Luca Coelho <luciano.coelho@intel.com>
References: <20240209140818.106685-1-michal.winiarski@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20240209140818.106685-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 2/9/24 15:08, Michał Winiarski wrote:
> Fix one of the tests in drm_mm that was not converted prior to
> drm_debug_printer removal, causing tests build failure.
>
> Fixes: e154c4fc7bf2d ("drm: remove drm_debug_printer in favor of drm_dbg_printer")
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>   drivers/gpu/drm/tests/drm_mm_test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
> index 1eb0c304f9607..3488d930e3a38 100644
> --- a/drivers/gpu/drm/tests/drm_mm_test.c
> +++ b/drivers/gpu/drm/tests/drm_mm_test.c
> @@ -188,7 +188,7 @@ static void drm_test_mm_init(struct kunit *test)
>   
>   static void drm_test_mm_debug(struct kunit *test)
>   {
> -	struct drm_printer p = drm_debug_printer(test->name);
> +	struct drm_printer p = drm_dbg_printer(NULL, DRM_UT_CORE, test->name);
>   	struct drm_mm mm;
>   	struct drm_mm_node nodes[2];
>   

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


