Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4580244D71F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 14:21:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977EE89E69;
	Thu, 11 Nov 2021 13:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1988789CAF;
 Thu, 11 Nov 2021 13:21:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="233153631"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="233153631"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 05:21:11 -0800
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="733179575"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.72.185])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 05:21:06 -0800
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1ml9zh-0000wf-0i; Thu, 11 Nov 2021 15:19:57 +0200
Date: Thu, 11 Nov 2021 15:19:57 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>
Subject: Re: [igt-dev] [RFC PATCH 0/1] drm: selftest: Convert to KUnit
Message-ID: <YY0YfV4WECXFMhYw@platvala-desk.ger.corp.intel.com>
References: <20211111003453.209115-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211111003453.209115-1-andrealmeid@collabora.com>
X-Patchwork-Hint: comment
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
Cc: melissa.srw@gmail.com, linux-kselftest@vger.kernel.org,
 rodrigosiqueiramelo@gmail.com, maira.canal@usp.br,
 Daniel Latypov <dlatypov@google.com>, n@nfraprado.net,
 Brendan Higgins <brendanhiggins@google.com>, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, arthur.grillo@usp.br,
 igt-dev@lists.freedesktop.org, David Gow <davidgow@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, ~lkcamp/discussion@lists.sr.ht,
 isabbasso@riseup.net, linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 09:34:52PM -0300, André Almeida wrote:
> Hi,
> 
> This RFC is a preview of the progress we made in the KUnit hackathon[0].
> This patch, made by Maíra and Arthur, converts the damage helper test
> from the original DRM selftest framework to use the KUnit framework.
> 
> [0] https://groups.google.com/g/kunit-dev/c/YqFR1q2uZvk/m/IbvItSfHBAAJ
> 
> The IGT part of this work can be found here:
> https://gitlab.freedesktop.org/isinyaaa/igt-gpu-tools/-/tree/introduce-kunit

IGT side approach looks good. There's a couple of obscure bugs that I
spotted but nothing that is unfixable when it's time to review in
detail.


-- 
Petri Latvala
