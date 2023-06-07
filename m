Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C90C725AB6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70CA10E498;
	Wed,  7 Jun 2023 09:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B13710E498
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:37:52 +0000 (UTC)
Date: Wed, 07 Jun 2023 09:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1686130669; x=1686389869;
 bh=/37RiszT2hQkqefLXSWgn0PU/fXLOedYWzon5kBfTN4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=GBWhjcPdoqCnveEEbJmt/yxGnkDBtWA1BUlvmhR8XKVJi5gj8vzLrvOV9zJkmtPxJ
 +dN/y3J8+ugQPuRlWcWsSUizo7P4rCv8eTdJ49MJLRIHf24GgIHgN0lKDLLhhwwL4p
 SwCJcLNH8Ru1A64ACawicz01uSLm9qValzkWawrzH5SJxPCdIORlpyHzqNkB/5HRlh
 EyYedqNG3qeWHAYIZSvV8H2n4Fxn2wN099l8kfbZeDaemnNVCylXs6G2cyKJwsdKsD
 LUcn+qSgdiYd0HfLuuNd2KJOSziphIBrbrv4SQlu2YtqObxEDVLnGrRAlOp2wUaNI5
 EvchU7xGQT4yQ==
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v5 04/13] drm/connector: Use common colorspace_names array
Message-ID: <cmrrldxWMcHBZPTtrtNWKhTmgBqdJcEl1XAHvp_OS3RQMTjVk_wvYkwmDYJNKX4AWIVR_GkjJcackYtcKfhQHD1_LirFv2cl5hVn7q3vnC4=@emersion.fr>
In-Reply-To: <20230606202607.122914-5-harry.wentland@amd.com>
References: <20230606202607.122914-1-harry.wentland@amd.com>
 <20230606202607.122914-5-harry.wentland@amd.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tuesday, June 6th, 2023 at 22:25, Harry Wentland <harry.wentland@amd.com=
> wrote:

> We an use bitfields to track the support ones for HDMI

Typo: "We can"
