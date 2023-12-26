Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BE781E6D6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 11:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D4010E085;
	Tue, 26 Dec 2023 10:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FF110E1A1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Dec 2023 10:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1703585419; x=1703844619;
 bh=sZFy75hKF/4F9B1nrXJ4XiFKlKCVz0gVueFCburBZb0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=AG8mafFII2i/YmQSe1+STW0AD/Lu9rdIdts/qDLplV9huMsfbPyhqtE04uacXDq8P
 TmvW2eBGegQyRD2SmrtQ6wbINbd2magIeqg6Iz+6VmkkYFvWQuMu7d6fVqqRvFzP3K
 /R3UgEViDSaYunMfjITW3xNyWYhC3jZUej6RfE2OfKQa5+PSFJZMnVlGg+NoGicOE8
 /gQyYtS68s/U8zv3s5iAxkl7aZPVbyiTvZP8BWy2+BrqaVM9eVP30snX4D7cI/hZDT
 l4h7mmhK9TVppTJRf+01zr/r68rhEK9xpGNpXzJ7wZ5JwM9FCEGWB/eXHKNzrk7zgo
 O8nqeO+3mtbLQ==
Date: Tue, 26 Dec 2023 10:10:13 +0000
To: Markus Elfring <Markus.Elfring@web.de>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/3] drm: property: Improve four size determinations
Message-ID: <FB3FfdyqvkWV2j31m-2vOt3ZR6N0aOICuCdgi7Z8bdmOgRg6FYqF-_7tMlbZiEhLHvsRYB124l65-lw0jTYHXKQBFn9xn81MnExufwwFmuA=@emersion.fr>
In-Reply-To: <29dea8dc-5a57-4c07-a857-e2c6a86c5c06@web.de>
References: <ff7ce5d0-59fa-470c-8dd6-68dbe65c18e5@web.de>
 <29dea8dc-5a57-4c07-a857-e2c6a86c5c06@web.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The whole series is:

Reviewed-by: Simon Ser <contact@emersion.fr>
