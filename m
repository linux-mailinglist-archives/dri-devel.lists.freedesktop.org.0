Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00686E42E3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 10:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD1810E3B5;
	Mon, 17 Apr 2023 08:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC1D10E3B5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 08:47:47 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59674DE6;
 Mon, 17 Apr 2023 10:47:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1681721259;
 bh=GktcEwyf2LwQ6NY0LHuBgtJ5WGGHaw1b0hIIRAgA2Q0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=m5BRM+SgWPTQUonWy/ReGbOSc++sNjonGnQSxO+O5hR6EIqBQhCe01gimQwtYoZZh
 0rN3MN9cUahvdHwYGqm6xHBnrQ/hYfBNT/4pbGUK/ghnH9eC3yNem+g8vmnQyZTiXM
 VFxdGh/55LnNic0Co82X9r+WIDSvHl+VjOm6MxBI=
Message-ID: <b974c741-9d3e-1229-bcd5-a980035d1fb4@ideasonboard.com>
Date: Mon, 17 Apr 2023 11:47:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/2] "no-hpd" support in CDNS DP bridge driver
Content-Language: en-US
To: Jayesh Choudhary <j-choudhary@ti.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org
References: <20230405142440.191939-1-j-choudhary@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230405142440.191939-1-j-choudhary@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, jani.nikula@intel.com,
 sam@ravnborg.org, javierm@redhat.com, jernej.skrabec@gmail.com,
 a-bhatia1@ti.com, alexander.deucher@amd.com, yamonkar@cadence.com,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 sjakhade@cadence.com, tzimmermann@suse.de, r-ravikumar@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/04/2023 17:24, Jayesh Choudhary wrote:
> In J721s2 EVM, DP0 HPD is not connected to correct HPD pin on SOC
> which results in HPD detect as always connnected, so when display
> is not connected driver continuously retries to read EDID and DPCD
> registers.

Where is the DP0 HPD connected to? Nowhere? If it's connected to a pin, 
can that pin be used as a GPIO? In other words, do we have a HPD, just 
not with mhdp, or is there just no HPD at all?

  Tomi

