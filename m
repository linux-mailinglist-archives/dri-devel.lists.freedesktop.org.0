Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 892657D88D7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 21:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804C510E049;
	Thu, 26 Oct 2023 19:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A077210E049
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 19:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1698347778; x=1698606978;
 bh=E2NucHGhawE7umziFqKgq1RTpKC+vSGdoNi4uDmD6FE=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=OGOf6+JNwEQTrMigcOaY7d7ydOnk+80nGqlLc/ll+fPbAv54ezU4uXmhIOiT1H7RR
 eUAciy/WvgqIpQLiScJktTH2Bnuas6QcYTVQlBRqPrGE2HcJuVHCHJ+G2MAGciZPt9
 i+igZbNPKL4nnHAH64I0cIGH2w0fs5DFhyC0vWuEVaoweDWgLN1ywEpLduvFvrrAIa
 oAxONcnkuPU86JYrUurrWKkGrMAuf/yzSS5rdbMliinMTV7pgv4vrf1Oa5bSYz60EG
 j0AVVEAIL5+vSBN/f4fnMoBV/m9e0AZLm1rkF93L56NaOSASCEa5FlGazsZe3K0kL7
 2baqQVMqobXDg==
Date: Thu, 26 Oct 2023 19:16:15 +0000
To: Erik Kurzinger <ekurzinger@nvidia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE
Message-ID: <qBT834zTNzsElUXeKdO8YHrH7VgmmqKRy9k60884hcRc0ATUcIiOK9smiiQHEHfQbMDcqAaPVe1pyMTwp5luV-OwLNUPA_h2DjVnaU0p1Qs=@emersion.fr>
In-Reply-To: <a42f1e8d-2c9a-4511-ba10-64f494ba6920@nvidia.com>
References: <1fac96f1-2f3f-f9f9-4eb0-340f27a8f6c0@nvidia.com>
 <a42f1e8d-2c9a-4511-ba10-64f494ba6920@nvidia.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, October 26th, 2023 at 19:55, Erik Kurzinger <ekurzinger@nvidia=
.com> wrote:

> Is there anything else needed for this fix to be merged? I have shared
> an accompanying patch for the IGT test suite here
> https://lists.freedesktop.org/archives/igt-dev/2023-August/060154.html

Do you also happen to have user-space patches to use this? That's also
a requirement for new uAPI.
