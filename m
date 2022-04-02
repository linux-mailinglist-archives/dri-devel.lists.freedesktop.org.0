Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9004F05DF
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 21:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2BA10E008;
	Sat,  2 Apr 2022 19:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A66C10E008
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 19:37:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id m30so8766835wrb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Apr 2022 12:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=80wofTwbxJqppPX/gKsG/MIQEWwl0NPubl49Nu0tXCc=;
 b=sWKLVd+x2DbLhiDnbts76cHlkFQEQHsmlx6qJ6nxYCvQlpVs+QDMyZC4OAVm5yENNZ
 dmTE3oRApLfp54aGaApEC3lWdpn3tW7makqGRG1e3fUJr9BjZ3pr6B9FuJbTXY2XGkfj
 CHjIP/7S3u7QgdxB2gEMBijjDRZFO7QnsThw8owkGCiYzw6JnxUlkENZmy1ijsCykVEv
 0nCqaamI/cFQcVMRYFwRsY9eo7yz15n7nqrSHvEtN9nRNrm8ndytQkH9r2GOcl7YAfuL
 mXPCrq0v5Y+rWzbGW4RT1gnupsb3D1aRitry+HPWnrUqB+mKphJdfPD3vwH7LjZ6hL+o
 VkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=80wofTwbxJqppPX/gKsG/MIQEWwl0NPubl49Nu0tXCc=;
 b=gea/HHiEieZtLpQLww+pVF74/EE9kvc4M8V44ngHWhtTM8pMgfWmqtSMvCxwFXsos8
 d6fMwuSQrfxqycPcTgTBARyvYy1baJ8pLwjbXf91iGOjd0hHyIPrY36tn+5oMhj6LkON
 ENo7Rl+CH3LdVSH7gcIjRgwAl5cXESFsP1kmQwdJls/l+jjUGxj0n2O6grUZD0gJbfXE
 H/CS/IsX2CmodbvYfsnHkypBpDTYMht1QUv0TUMDHsm/iAFKovJaGuvm8ukBNtf8dwS3
 Fx4YPd3cReDomEv7SnPOSOFAUOG/7Aq2qRJQR/Wm1zAGZsA06MovYHvh7ngEX6/aL2d3
 EdFg==
X-Gm-Message-State: AOAM533/Bhcl1GhvLkNbq+qJ57/WHPQqbvXAiHtSKT3L4uPADU1fDiVJ
 BR/BQ0blSChh4XyZCEuWJugJO8f3nASbXoUm
X-Google-Smtp-Source: ABdhPJzTVam/vm4DE1k8FMuXemOpPbS4zYtmup8fzVrX6VI7CelNUeeNzpxvBUgZEQYY2gni86+dAw==
X-Received: by 2002:a5d:6d0c:0:b0:204:d77:313a with SMTP id
 e12-20020a5d6d0c000000b002040d77313amr12191546wrq.405.1648928265626; 
 Sat, 02 Apr 2022 12:37:45 -0700 (PDT)
Received: from bilrost ([2a01:e0a:28f:75b0:dea6:32ff:fe0d:99f9])
 by smtp.gmail.com with ESMTPSA id
 az26-20020adfe19a000000b00204154a1d1fsm5262746wrb.88.2022.04.02.12.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 12:37:45 -0700 (PDT)
Date: Sat, 2 Apr 2022 21:37:43 +0200
From: Anisse Astier <anisse@astier.eu>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH AUTOSEL 5.17 001/149] drm: Add orientation quirk for GPD
 Win Max
Message-ID: <YkimB7AoV27gXFc9@bilrost>
References: <20220401142536.1948161-1-sashal@kernel.org>
 <YkdhftH7tyPU8Gqt@bilrost>
 <dcc41ac1-107b-7ada-ff41-da69d94f1274@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcc41ac1-107b-7ada-ff41-da69d94f1274@redhat.com>
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
Cc: Sasha Levin <sashal@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, airlied@linux.ie, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le Sat, Apr 02, 2022 at 11:14:58AM +0200, Hans de Goede a écrit :
> Hi,
> 
> On 4/1/22 22:33, Anisse Astier wrote:
> > Hi Sasha,
> > 
> > Le Fri, Apr 01, 2022 at 10:23:08AM -0400, Sasha Levin a écrit :
> >> From: Anisse Astier <anisse@astier.eu>
> >>
> >> [ Upstream commit 0b464ca3e0dd3cec65f28bc6d396d82f19080f69 ]
> >>
> >> Panel is 800x1280, but mounted on a laptop form factor, sideways.
> >>
> >> Signed-off-by: Anisse Astier <anisse@astier.eu>
> >> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> Link: https://patchwork.freedesktop.org/patch/msgid/20211229222200.53128-3-anisse@astier.eu
> >> Signed-off-by: Sasha Levin <sashal@kernel.org>
> > 
> > I don't think this patch will be very useful, because it won't fix the
> > device's display orientation without the previous patch it came with,
> > titled "drm/i915/opregion: add support for mailbox #5 EDID"
> > (e35d8762b04f89f9f5a188d0c440d3a2c1d010ed); while I'd like both to be
> > added
> 
> Well actually it will already put e.g. the text console the right way up
> since efifb also uses this quirks and gives a hint to fbcon to rotate
> the text. So it is not entirely useless.
> 
> And since all quirks added to drivers/gpu/drm/drm_panel_orientation_quirks.c
> typically get backported having this one in place now will avoid conflicts
> with future backports.
> 
> That combined with not really seeing a downside to already having
> this in place even without the i915 support being sorted out makes
> me lean more towards the direction of believing that having this
> in 5.17 is fine...
> 

Good points; lets's keep it in the stable queues.

Thanks,

Anisse
