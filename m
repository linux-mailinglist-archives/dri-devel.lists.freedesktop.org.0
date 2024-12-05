Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3F29E5678
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 14:20:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22FC10EE5D;
	Thu,  5 Dec 2024 13:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+EzSZlc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5972E10EE5D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 13:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733404837; x=1764940837;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MfMc4COjKLP6gP/dCy1YOujaYlfiGn2Phdwdm6+xjUI=;
 b=l+EzSZlcvYOXWsCMAJwFut44thHpgKDxLU67SD53dCgi4IMfp0UpVozo
 frp3+89FgQ27Zjp/P5OMABwlMuigUMD+ryAIdLI/9lJxQ6t49FYVKBZKf
 vt1+jQgAhdoQzttOoOfbvDHsvz+rjfk2eEi8GaUYXYmph9coxXPNcIvW6
 p2H0954gQ6jQUD/xqflKvS8O84uaxtQ9f1K0b6xtbDodzOFrqflPNwDDg
 rNc7zhyavb4sqrBkYlxM4/ntAkKW6OjwKHvio8Z+cO8EEJ6u0d48pP9Jp
 zYKdPrYL1na5NKKC6TJzfbKhK7rzUuh+R5kG9LxO0rdNKpDvCGQlVpCV2 w==;
X-CSE-ConnectionGUID: majZ25NZSJyEOxizAhBPyQ==
X-CSE-MsgGUID: S6+//4SnQTq7QeRnhGUl3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51255997"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="51255997"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 05:20:37 -0800
X-CSE-ConnectionGUID: rQp2+6VrTBu6wVUgLDnGzQ==
X-CSE-MsgGUID: vR7gffMRQwapHCVdU/6K5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="99057971"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 05:20:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] media: cec: include linux/debugfs.h and
 linux/seq_file.h where needed
In-Reply-To: <7d7355f4-ee73-41a6-9d62-f15cb5135e41@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241127095308.3149411-1-jani.nikula@intel.com>
 <87plme78hm.fsf@intel.com>
 <7d7355f4-ee73-41a6-9d62-f15cb5135e41@xs4all.nl>
Date: Thu, 05 Dec 2024 15:20:33 +0200
Message-ID: <87h67i1d26.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 29 Nov 2024, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 29/11/2024 09:24, Jani Nikula wrote:
>> On Wed, 27 Nov 2024, Jani Nikula <jani.nikula@intel.com> wrote:
>>> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>
> That email no longer exists. Just use hverkuil@xs4all.nl or
> hansverk@cisco.com, either works, but I prefer my private email.

Sure. It's just that hverkuil-cisco@xs4all.nl is still all over the
place in MAINTAINERS in Linus' master.

BR,
Jani.


-- 
Jani Nikula, Intel
