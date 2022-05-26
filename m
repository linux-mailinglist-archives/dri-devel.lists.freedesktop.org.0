Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A97535442
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 22:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D0510E619;
	Thu, 26 May 2022 20:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F119C10E619
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 20:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653595854; x=1685131854;
 h=message-id:date:mime-version:to:reply-to:from:subject:
 content-transfer-encoding;
 bh=YyqmXpdJFKAGANkPj9NSIDpH2Nj2UX/7kJJxv2yBbN8=;
 b=C6cm/+HqyNLZ83XgyGqJt2E21nAtCpNclgv28iF01SzTiwTkgKY90R3H
 XTF4GXiJb5reLQhQQ6v6QFcIwNHhA97Mit9XoBhR1Jg/DMGAY9+BHE34x
 g0vO++10NRWh7WwedRaEfr983SAmjE+n7lPmw/E6oRZn1/Jve/yXv5hQj
 xtXlKyWx2dcqjkS3ZToTh8vJa8OKbHLhjCOgiVALNWnjm+/UupUr6VTWC
 f4K5Ag7WKIFbKnx/g19leEkg1AAIx7VkwkAOx4QvnzTN28r0J84FEEgOM
 0u9yEExAio+3HXW9BXCul0Zrb5/IFtgwHuA/mSP5L5U1pn22Be4N3vi+f w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="274278318"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="274278318"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 13:10:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="549760781"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 26 May 2022 13:10:53 -0700
Received: from [10.249.136.244] (patrykma-MOBL.ger.corp.intel.com
 [10.249.136.244])
 by linux.intel.com (Postfix) with ESMTP id F1905580B54
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 13:10:52 -0700 (PDT)
Message-ID: <98362bde-8607-c5b3-6d56-5cd14128685f@intel.com>
Date: Thu, 26 May 2022 23:10:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: dri-devel <dri-devel@lists.freedesktop.org>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: [1/2] dma-buf: Add an API for exporting sync files (v14)
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
Reply-To: 20220506180216.2095060-2-jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

