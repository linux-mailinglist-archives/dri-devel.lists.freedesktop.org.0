Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 249B8187BBA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 10:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124A789174;
	Tue, 17 Mar 2020 09:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C2489174
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 09:08:45 +0000 (UTC)
Date: Tue, 17 Mar 2020 09:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1584436123;
 bh=/SuKDVkixjleiXkX9yBABHxAiGaPws7w+J17iKLDmuU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=ZOgBnSXnfLVTMQfZzD9ykVNELwpS1CrpYPVPVHMJPHQ/lJWnyc1QsvtB+QDsaZI+D
 Q+KIsXCssui/gSR2DKvQ569kJKOTh/J262kak3/F1XIPcJ7bIjq6ZnNt7i/uoLIgTK
 Tk341LEs6A7hFeQ+gbWsBQTmqJnADt/1vV9AZWJc=
To: Harry Wentland <hwentlan@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Variable Refresh Rate & flickering screens
Message-ID: <vjPM-1gAz4OKHfOHPPwHH_InBbZpD9EsrXKujfN7QKEEME_LmCEsZ-tXJiAAOhyG2mkN8GcNZmpEgGwRgqPlOYumKiLXk2jBGZuWavGYVMM=@emersion.fr>
In-Reply-To: <db6547cf-77d7-5163-8926-e1bb5ddb6d57@amd.com>
References: <bRy2hTFvMya3tNzlzsjQv6uzpsgC18d0NYQx1A9Otma6wCsYLHH9X6esb47-9KWzUjVNWTi3VXCVLVGX-dlW17P0YeCFCg4OZ4KEykC0Czw=@emersion.fr>
 <647ff0e7-f186-4e16-f9b9-0908a3171051@daenzer.net>
 <tQBNlPxJxKY8FDg82d7XAuqLUkgBj4ATufP43APGI17BfwCiRpJCpUOSZiAq0V-6QONBC8S_dpI4sHsb-qQkhfkKX4usw6hSSUG_pXO3uX0=@emersion.fr>
 <db6547cf-77d7-5163-8926-e1bb5ddb6d57@amd.com>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Scott Anderson <scott@anderso.nz>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Anthony.Koo@amd.com" <Anthony.Koo@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, March 12, 2020 3:43 PM, Harry Wentland <hwentlan@amd.com> wrote:

> Not the main VRR expert and we're still discussing this internally but I
> think it'll very much depend on the display whether you'll see flicker
> in this case.
>
> The other complication is that for gaming we don't want to use the
> cursor as a VRR trigger and only look at page flips in order to allow
> for smooth gameplay. For a desktop use-case that's probably not the
> right policy.

I think user-space can handle this and correctly synchronize cursor
updates with game updates via the KMS atomic API.

However I still think flickering should be avoided by the hardware.
Flickering is a completely separate issue and user-space shouldn't add
workarounds for screen issues like this.

Do you think that would be acceptable? Do you have any "slew rate
register" in AMD hardware?

Thanks,

Simon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
