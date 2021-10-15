Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5536742F696
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 17:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155566EDD6;
	Fri, 15 Oct 2021 15:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0BC0D6EDD6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 15:06:57 +0000 (UTC)
Received: from [192.168.178.106] (p57bc9963.dip0.t-ipconnect.de
 [87.188.153.99])
 by mail.bugwerft.de (Postfix) with ESMTPSA id 8A25148E465;
 Fri, 15 Oct 2021 15:00:55 +0000 (UTC)
Message-ID: <68ec9712-5f3d-c572-99ee-2cbcaa84a6d7@zonque.org>
Date: Fri, 15 Oct 2021 17:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v8 0/2] gpu: drm: add driver for ili9361 panel
Content-Language: en-US
To: airlied@linux.ie, daniel@ffwll.ch
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20211015145910.1020068-1-daniel@zonque.org>
From: Daniel Mack <daniel@zonque.org>
In-Reply-To: <20211015145910.1020068-1-daniel@zonque.org>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/15/21 16:59, Daniel Mack wrote:
> This is v3 of the series.

Ups, sorry. Ignore this one. I meant to resend a different version of
this series.


My apologies,
Daniel



> 
> Changelog:
> 
> v2 -> v3:
> 	* Turn Documentation into yaml format
> 
> v3 -> v4:
> 	* Fix reference error in yaml file
> 
> v4 -> v5:
> 	* More yaml file documentation fixes
> 
> v5 -> v6:
> 	* More yaml file documentation fixes
> 
> v6 -> v7:
> 	* Fix ordering of patches
> 
> v7 -> v8:
> 	* More yaml file documentation fixes
> 
> Daniel Mack (2):
>   dt-bindings: display: add bindings for newhaven,1.8-128160EF
>   drm/tiny: add driver for newhaven,1.8-128160EF
> 
>  .../display/panel/ilitek,ili9163.yaml         | 69 +++++++++++++++++++
>  drivers/gpu/drm/tiny/Kconfig                  |  13 +
>  drivers/gpu/drm/tiny/Makefile                 |   1 +
>  drivers/gpu/drm/tiny/ili9163.c                | 224 ++++++++++++++++++
>  4 files changed, 307 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9163.yaml
>  create mode 100644 drivers/gpu/drm/tiny/ili9163.c
> 

