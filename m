Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B307673B165
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF9310E603;
	Fri, 23 Jun 2023 07:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 584 seconds by postgrey-1.36 at gabe;
 Thu, 22 Jun 2023 18:00:50 UTC
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A550310E09D;
 Thu, 22 Jun 2023 18:00:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 4E370320091F;
 Thu, 22 Jun 2023 13:51:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 22 Jun 2023 13:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 joshtriplett.org; h=cc:cc:content-type:content-type:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1687456264; x=1687542664; bh=YShG2YqeRJvKnP47Pbk8/8ySMjdc+Phgy1r
 7NJzoXfc=; b=SF3aqluC/IlV+k9DLDSKAp+31amBIhvk9UE5+dvW2Ijcyr2bJd4
 7BlRGHlvlhEcD4Es9xhE49EDHdXY14Y9VhiNFGgyN9mNh/ckoU+Lgk19fyJ3B7uE
 rhxbJMjWclOH19bup1IS1I58Ji9J7ZLdtPgxVekAdWjXUlPvp1K1O/2GmW5SYaLn
 VC92wrrivqS1T2YM35Ma8GJtCrU4Mq64PHQpXg+ojptdUYvnVYD81zCNZ/rOR9hr
 P/qZ/s1LI1P/sTejJDnQaY7LDXZJE7EXT6bwrjIaMa5z6arhVJJpLG8Q0OQrgsWZ
 3VRWPbmnvhYX823N1TCaRp7Ca5Hh2sP9KuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1687456264; x=1687542664; bh=YShG2YqeRJvKn
 P47Pbk8/8ySMjdc+Phgy1r7NJzoXfc=; b=exlrvdUYUoMDG8MDXJ8u8mfxKtEql
 +zvUJJEZqVlqgS2f67G+puMPmbRlwYzmsduZvG9JAAk6hODatMPKHKOflm3gDgbX
 zDxvDgVHkbG0+cB6Pt0dFymjlKbpU/9Hlm7fwlR+0hwgKJxMr1tL6copOCPLoFk6
 zd1E5gPzw8s71taUVWS8ooi9oiqjcboIKf70QmcUSlnemLCb4TuvujRTXcZ4BPL7
 OF13mvUPO81n2iZNq0sseF2ivH9VLx7Lsd1Kfsuk+Vd7pzPfJotq/P/zeqE6G0Vf
 x+BgiWCCa2QbCrsxCAR1oegwfb/zkCW2OJwRFqm9kgcfAo3bZyPhIAGng==
X-ME-Sender: <xms:CIqUZOCWTi7LHibaGxvSsS6xEUlBv81h7KpEef4rpz_CleKsvMIEEQ>
 <xme:CIqUZIiZefH6j351xw6pxT3OOdWfXeQjsn1Kiyuhd5inDVVNLTv-dZBg9bYl6eqkZ
 PDBsfJpdJKNl02wr2Y>
X-ME-Received: <xmr:CIqUZBnndoFOiCBp3zE5ERyz8sRZzBfNzolriwqpEq4ORKrX_P-2PRQUZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeguddgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeflohhs
 hhcuvfhrihhplhgvthhtuceojhhoshhhsehjohhshhhtrhhiphhlvghtthdrohhrgheqne
 cuggftrfgrthhtvghrnhepudeigeehieejuedvtedufeevtdejfeegueefgffhkefgleef
 teetledvtdfftefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepjhhoshhhsehjohhshhhtrhhiphhlvghtthdrohhrgh
X-ME-Proxy: <xmx:CIqUZMxHMPGMLqp_7goph5HF9ACxdJaRhk3QB8RLR29uttOK1ociGA>
 <xmx:CIqUZDSeY2alb9ohgujJ86ysfhJbDSJtXn9xfmIBI3dCIMh7rTgW8Q>
 <xmx:CIqUZHawY4mh0BN-A7VjtW3nnkkzcSIFcCdf-5fSJCao7mrZ0nki-w>
 <xmx:CIqUZBP7AEHWCuGC7aelRvD_EUMgp32WZSuWSMDyEb6sbIbpxdajIg>
Feedback-ID: i83e94755:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jun 2023 13:51:03 -0400 (EDT)
Date: Thu, 22 Jun 2023 10:51:02 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: Allen Ballway <ballway@chromium.org>
Subject: Re: [PATCH v2] drm/i915/quirk: Add quirk for devices that cannot be
 dimmed
Message-ID: <ZJSKBg+LymhvINoG@localhost>
References: <20230606211901.1.I06e778109090b5dc85c44da7b742d185aa6adb59@changeid>
 <20230622172817.2281527-1-ballway@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622172817.2281527-1-ballway@chromium.org>
X-Mailman-Approved-At: Fri, 23 Jun 2023 07:26:31 +0000
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
Cc: intel-gfx@lists.freedesktop.org, arun.r.murthy@intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 22, 2023 at 05:28:15PM +0000, Allen Ballway wrote:
> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
> @@ -1192,6 +1192,11 @@ static u32 get_backlight_min_vbt(struct intel_connector *connector)
> 
>  	drm_WARN_ON(&i915->drm, panel->backlight.pwm_level_max == 0);
> 
> +	if (intel_has_quirk(i915, QUIRK_NO_DIM)) {
> +		/* Cannot dim backlight, set minimum to hightest value */

Typo: s/hightest/highest/
