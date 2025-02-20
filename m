Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37525A3D9DF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 13:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A302A10E4C4;
	Thu, 20 Feb 2025 12:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Gcm0WKGu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D187610E4C4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 12:24:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B6CF5C4978;
 Thu, 20 Feb 2025 12:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB86C4CED1;
 Thu, 20 Feb 2025 12:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1740054273;
 bh=H9JOLb25VJ1CViiik1hopte6xGG2qyu1JhXJyc7Xg8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gcm0WKGubC8cYKkiMOFkTcbj8ALCbbwVPfUcLOhY+KEvT9oJowhsYw2Zn0MTNc8NG
 NNkaSd3aJ4JWdWxTTOTtgDpJwPpkCbQ7sOBTheQB/iKT67E1m8bvWS+Fnw//RlJQc3
 hy0K3mNKm0z3jkj7mlJ1Ah0ZK4Ue7daVC9ZOmyBo=
Date: Thu, 20 Feb 2025 13:24:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 3/6] drivers: base: component: Add debug message for unbind
Message-ID: <2025022024-salami-scabbed-08bc@gregkh>
References: <20250212200542.515493-1-lucas.demarchi@intel.com>
 <20250212200542.515493-4-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212200542.515493-4-lucas.demarchi@intel.com>
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

On Wed, Feb 12, 2025 at 12:05:39PM -0800, Lucas De Marchi wrote:
> Like when binding component, add a debug message to the unbinding case
> to make it easy to track the lifecycle. This also includes the component
> pointer since that is used to open a group in devres, making it easier
> to track the resources.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
