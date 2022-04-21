Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8AB50AA8E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 23:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C4F10E111;
	Thu, 21 Apr 2022 21:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8137910E111
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 21:15:35 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 38EC780330;
 Thu, 21 Apr 2022 23:15:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650575732;
 bh=1NBW7cL4XbwP++ELCJSDMHYeS2FArnfJ2W/HAwE036U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ncDr7gwUtjYlpOyWwW36HcCr0d4N7ZZSCHzhgGPW8ziqEfeqvsW3M13VPcDzFv1uk
 F9VDOW+SA2ddXonhORsCRZMrjPX3d/54gRgIClZSMXl0gu0QESHhRQwVssAsSiRxLC
 TOjwh8epBVzVCieGmoVBsdBAHz8CtzN+AApbGz9/vfw9LsxxDfjJiLwazkxTfPj9TW
 xjeXkGWkuX3aaDw+/nwSsm/wncAxNS3nSa9qwM6Giizzkz135otcsppMTcUdogzrJa
 XukXRxN8a7QoqcE55zjr8/jh3jnpPAo0bWPhYwK4wXmUJU6mORwrQxjQsP6sYfHPC9
 utloCcFP/AczA==
Message-ID: <6ac15b2c-1233-8e59-544e-43a4f2f7fc19@denx.de>
Date: Thu, 21 Apr 2022 23:15:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] drm/modes: Make width-mm/height-mm check in
 of_get_drm_panel_display_mode() mandatory
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20220411004728.68203-1-marex@denx.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220411004728.68203-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, robert.foss@linaro.org,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/11/22 02:47, Marek Vasut wrote:
> All users of this function require width-mm/height-mm DT property to be
> present per their DT bindings, make width-mm/height-mm check mandatory.
> It is generally a good idea to specify panel dimensions, so userspace
> can configure e.g. scaling accordingly.

I will apply these two patches soon.
