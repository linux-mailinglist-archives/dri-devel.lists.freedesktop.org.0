Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 830FB602644
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 09:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E9110EEE0;
	Tue, 18 Oct 2022 07:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B79310EECE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 07:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666079875; x=1697615875;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=bqImEB+yvL0B34u8zHyOqETYJpxh7Vk7QwgV8/K1r78=;
 b=k77BNIuw7y6L9j2A5p/f/BRZuNLBVt2aO1wknGn9xbKSVLX6I8wozGwS
 x8LZLpZ/OzlMzfej/ZIxcaXLB5frgXA0LiCZfJqqoGH7Obayg4JHZ3s2s
 tq8a5JE5hnDXhBIX3CCZSDdRaWQdf03Z7t46bRp3AzWgSnSknQWcUcSKz
 W8OFopkZ9A3ckyoM/tzuJ35wIjfOQFCtbY/sHPPcRQvFYsmjgAgr6/S0N
 FAQg1KiWRVlEcjkhkzx+lArgujNp6aStqx+MNVLSMNA/UlvEUoPmA8Njo
 i+Oae2qZexH1vjQ1j1LWkd5Ot4lR23EqlwKqKBPrzaslhhgJlbRur0eE3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="286423410"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="286423410"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 00:57:54 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="691689362"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="691689362"
Received: from wwang77-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.86])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 00:57:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: jianengchencool <jianengchencool@gmail.com>, Sean Paul
 <sean@poorly.run>, Eric Anholt <eric@anholt.net>
Subject: Re: logging:convert dev_info to drm_info
In-Reply-To: <13519195-1D4F-4B55-9AEB-271E1CFAFB58@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <13519195-1D4F-4B55-9AEB-271E1CFAFB58@gmail.com>
Date: Tue, 18 Oct 2022 10:57:50 +0300
Message-ID: <87pmepimwx.fsf@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 Oct 2022, jianengchencool <jianengchencool@gmail.com> wrote:
> I want to convert logging dev_info/warn/err to drm_info/warn/err in
> drivers/gpu/drm/pl111, so I want to ask if this work will be merged=EF=BC=
=9F

Where are the patches?

BR,
Jani.

--=20
Jani Nikula, Intel Open Source Graphics Center
