Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D46C06A742E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 20:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714C710E222;
	Wed,  1 Mar 2023 19:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4553 seconds by postgrey-1.36 at gabe;
 Wed, 01 Mar 2023 19:23:20 UTC
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66CE10E222
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 19:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=DEHuGQj2+DXozvmGq6DFxNUuE0Htn76JYS6qawJks90=; b=f5v6RLcG99v3R4pu62WlaZ/ZYs
 LGQZbwszRw7uKKckEeHFVZGFEjAeEgGhVsIPxNOhETU+yaCI+7YPP7PBh+ZhjvSNLgmX9yZMesjrn
 Jh+AuvBfMLG0CoopG3sbJGFFSQWoIJcEUGE+vbQLRNyu7h+rYGZ/IhSfwbEjDq3FK2f1QXOVm8c7+
 IdtozIgKduBzuHkwQl+fjGBvgQjd44hV5PM3zd4pcImi7CY5S9ZylMwmkT/BjxWZJbU7V+0C1hbp4
 DKMjLfYLcBCRn8q2QBOcAEJlIEWrXu/PhIzK7BOXUYbVUzq+57QQ9j7gXH3D6NkILs/ZjdRMdI9dC
 c6woLkYQ==;
Received: from [2a01:799:961:2c00:5fc6:a9a5:c042:d1cd] (port=35532)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1pXQrM-00AhCQ-Eo;
 Wed, 01 Mar 2023 19:07:24 +0100
Message-ID: <9d95b8ec-8f40-699e-16b2-3ee19126457f@tronnes.org>
Date: Wed, 1 Mar 2023 19:07:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: gud: set PATH connector property
To: Simon Ser <contact@emersion.fr>
References: <l85gVq-EKaN9dzH4I8FXxv-4FyPkLSh7R5SgmqwFuh-oBtzFXFfvK8VVnTdvWpKBDITXvGrnMM0VijQoUkXeWCMMaFb4GSYpaUcmXm2fvlM=@emersion.fr>
Content-Language: en-US
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <l85gVq-EKaN9dzH4I8FXxv-4FyPkLSh7R5SgmqwFuh-oBtzFXFfvK8VVnTdvWpKBDITXvGrnMM0VijQoUkXeWCMMaFb4GSYpaUcmXm2fvlM=@emersion.fr>
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
Cc: peter@stuge.se, DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,

On 2/28/23 12:36, Simon Ser wrote:
> Hi Noralf,
> 
> Would it be possible to set the PATH connector property based on the
> USB port used by gud?
> 
> This would give user-space a persistent identifier for the connector:
> if the user plugs in a USB display on a given port, the PATH would be
> the same even if the machine rebooted or the displays were plugged in
> in a different order.
> 
> DP-MST already sets this. User-space can use this property to store
> output configuration metadata.
> 

drm_mode_connector_set_path_property() docs:

This creates a property to expose to userspace to specify a connector
path. This is mainly used for DisplayPort MST where connectors have a
topology and we want to allow userspace to give them more meaningful names.

Here it says that it's about giving meaningful names to connectors, I
think it would be useful to know that a HDMI-A connector is on a USB
adapter for instance and not on the laptop/motherboard.

You mention output configuration however, why does userspace use the
path to a connector when storing the multi display config and not some
unique property on the displays themselves like the serial number?

Noralf.
