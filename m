Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 690B360000A
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 16:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4C510E54C;
	Sun, 16 Oct 2022 14:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A02210E54C
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Oct 2022 14:51:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC40A60BC7;
 Sun, 16 Oct 2022 14:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 031EFC433C1;
 Sun, 16 Oct 2022 14:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665931876;
 bh=V/xVhzZcKriWTF7ef3fNM4E6qqbpen5/10aZ9OB+sT0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UsI35QL2VoJZr4pY2itEXkyJS1+Zhfqxofb5kkLD/QnZXzyBTb+rAJ0rCmz1+TTa2
 E+Vq6o+iE/bTTQX2CBi+eIJACyEWInbJCvoRPqCs12CjXL6dOmn2NnFD5/8bKwwkmW
 IgChtayRQUicSdNJtpe8dOsPRMJEoCHPe7UbpsZakQCEoXw6jWuzKWzXIOIZt//6QD
 GwVC0UUEcNRS8s3RXDGCELi/l2bCy9s95+TpvaONby83piM9HbN+QS7FNxTTRdJqNx
 NcEVbk857NhhzDKB74ueHxhFuWwPNAT77sqyDZEDusSltb7+bUPpUJ3giQcQtkrnU+
 npXVDibWn2IAw==
Date: Sun, 16 Oct 2022 10:51:14 -0400
From: Sasha Levin <sashal@kernel.org>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH AUTOSEL 6.0 16/44] drm: hide unregistered connectors from
 GETCONNECTOR IOCTL
Message-ID: <Y0waYpSkyRRw4rVI@sashalap>
References: <20221009234932.1230196-1-sashal@kernel.org>
 <20221009234932.1230196-16-sashal@kernel.org>
 <0-fHhpvbGPf-w86Z7MGNoAe5uxHJy7vAdHcgjqqC2x8UWTZ7YY6wYORyxtrzDIf2pyPLt7z6dfFGOeUozmm7o0Qz0hpmhevj38g3Np3H1jI=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <0-fHhpvbGPf-w86Z7MGNoAe5uxHJy7vAdHcgjqqC2x8UWTZ7YY6wYORyxtrzDIf2pyPLt7z6dfFGOeUozmm7o0Qz0hpmhevj38g3Np3H1jI=@emersion.fr>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 13, 2022 at 07:31:19PM +0000, Simon Ser wrote:
>Jonas has reported that this breaks Mutter. Sasha, can we remove this
>from the stable queue?

Yup, I'll drop it for now. Thanks!

-- 
Thanks,
Sasha
