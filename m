Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A927A80D4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 14:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81A510E4AF;
	Wed, 20 Sep 2023 12:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8658E10E4AA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 12:40:31 +0000 (UTC)
Received: (qmail 11716 invoked by uid 990); 20 Sep 2023 12:40:29 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Message-ID: <b96daf56-8ca3-4527-adea-d96937c8343f@lausen.nl>
Date: Wed, 20 Sep 2023 08:40:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: MT8192 panel_edp_probe trace due to Unknown panel CMN
 0x142b
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <ca32347a879c794577f272a1473e44ee39f2acdc@lausen.nl>
 <6dd87d1b-255f-aeea-0445-37d34d242282@collabora.com>
From: Leonard Lausen <leonard@lausen.nl>
In-Reply-To: <6dd87d1b-255f-aeea-0445-37d34d242282@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: BAYES_HAM(-0.22044) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -0.31044
Received: from unknown (HELO unkown) (::1)
 by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Wed, 20 Sep 2023 14:40:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lausen.nl; s=uberspace;
 h=from; bh=HYAfRhXW3+fSJNB7JcVwgI/6cZJPCwWaAnpZPm6RMfg=;
 b=A86MvfwTGNMv2+EtS1Vw7YhtfdbVWiGDlG1L7Wx2YTWtvfCWC4Cb6BuRE/oZVE8MfJftlGlivs
 uFpjYhYaEczyP8OsF7hYUIlUFW3P0kOdV03Rln04uOfW2p7wl0CzKJS/GFyHKzsFuWzN91VIWzb1
 N5uhiI/GG1jGEETVRcGV3VuQy4G1FxoMYiDGIB0YxOKEJsjObHLRLXJMWnCKtwiDA63U+izkaQyi
 HZ6rxhMfQ1JAqgM8YwVtbqhNt+ZZBr3gkf0UflnbJvi5kLqdf7GQpq9F23ku9mvitJkjThVyXpV3
 0Dh4jfWIHAq6iog3ofjf0ojd4SrXH98cbcRuEiM+JzLfuHDLCzNbRqvO5t4vTdWkvjBzHKW+Benp
 arM154+Kp+QUqVih8TLiru5QACz8drY3LoasIA2hY/Lynt+/QTQqchF9BesVNBGyXpEWAswESftl
 Dg4pzCRQeWKij5FlK4Rs8+7nk7Q0VHf/WX6kk/6Ex8XIZTfFQk8u7ID5GQChBb0zW+mHHeQC92q2
 keCPaZGa3QA3+e8tkN4BWyi+rthUetEI6EwukManW0JX+EckXCGGBk8hX8Csogh6GnLfhX1cET/v
 HDFo+yhVlwCQOF5aa2DVrKb0UQoiGVgzV7mZkTmzUsYFQuUqRLLLT0VcbWkZHm+cenD3poL+bLQk
 c=
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
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Hello Leonard,
> thanks for sending me this snippet.
> 
> This is not in any way connected to my eDP/aux-bus patch series, infact this
> warning happens because your machine has got a new/different panel, read below:
> 
>     if (WARN_ON(!panel->detected_panel)) {
>         dev_warn(dev,
>              "Unknown panel %s %#06x, using conservative timings\n",
>              vend, product_id);
> 
> [    4.089721] panel-simple-dp-aux aux-3-0058: Unknown panel CMN 0x142b, using conservative timings
> 
> I'll try to retrieve informations about this new panel and add it to panel-edp
> as soon as possible.

Hello Angelo,

Thank you for taking a look. The Asurada Spherion is sold with either a
touchscreen or non-touchscreen panel. This one is a CB514-2H-K2HN without
touchscreen functionality. Hope this helps.

Thank you
Leonard
