Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB09193C24
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 10:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7326E2DE;
	Thu, 26 Mar 2020 09:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5147B6E2DE
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 09:45:42 +0000 (UTC)
Date: Thu, 26 Mar 2020 09:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1585215940;
 bh=8/qYPswHSvUuc84sM1CeW+sgypUAEG7pn/boIEX9OaI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=t5t/qBdPIoIqeoYCGzvpGuSxVeMHm2AlsVkqIfnVvX+K1vNqEeNITeAsIdBUHKKyH
 1dC2Bs/XwRbh0YpnDCy3nylHU2X0HJYSrcLAI+IUji/UKqgspHdtHAJH1X+bzTuAbY
 m7whujopFrZNFV29Q2OmojZADGoYkGbjcIaeqQJw=
To: Manasi Navare <manasi.d.navare@intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Variable Refresh Rate & flickering screens
Message-ID: <RsXshCxoEokeFtkXeps2iQuBSTq1ac0XozHLVSU71-WMdDRjTnffmdkJQTLdoruONU_H6ogvQNlQGSOMyDAxs-2TBOiJIu6W7TFasNaQ7zI=@emersion.fr>
In-Reply-To: <20200325185526.GA14320@intel.com>
References: <bRy2hTFvMya3tNzlzsjQv6uzpsgC18d0NYQx1A9Otma6wCsYLHH9X6esb47-9KWzUjVNWTi3VXCVLVGX-dlW17P0YeCFCg4OZ4KEykC0Czw=@emersion.fr>
 <647ff0e7-f186-4e16-f9b9-0908a3171051@daenzer.net>
 <tQBNlPxJxKY8FDg82d7XAuqLUkgBj4ATufP43APGI17BfwCiRpJCpUOSZiAq0V-6QONBC8S_dpI4sHsb-qQkhfkKX4usw6hSSUG_pXO3uX0=@emersion.fr>
 <db6547cf-77d7-5163-8926-e1bb5ddb6d57@amd.com>
 <vjPM-1gAz4OKHfOHPPwHH_InBbZpD9EsrXKujfN7QKEEME_LmCEsZ-tXJiAAOhyG2mkN8GcNZmpEgGwRgqPlOYumKiLXk2jBGZuWavGYVMM=@emersion.fr>
 <d921efb1-1074-1ac2-6eda-8ebb39a262d8@amd.com>
 <20200325185526.GA14320@intel.com>
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
Cc: Scott Anderson <scott@anderso.nz>, Harry Wentland <hwentlan@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Anthony.Koo@amd.com" <Anthony.Koo@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, March 25, 2020 7:53 PM, Manasi Navare <manasi.d.navare@intel.com> wrote:

> But I am still figuring out how the panel indicates this restriction that we need to program
> in the HW registers.
>
> Harry/SImon, do you know of any such panels that have these restrictions and if they
> indicate this limitation or the maxshift through EDID or DPCD?

As far as I've understood, there is no such information exposed by the
connector. This is the main annoying thing with this slew rate: it
seems like we can only guess what slew rate to pick.

Hence Martin's proposal to add some properties to allow user-space to
tune this (with sane default values that work on most screens).

Another idea is to have a hwdb of "bad VRR screens", and only apply
a slew rate to these screens.

Not sure what the best would be yet. Having a lot of VRR screens to
test with could help getting a better understanding. I think AMD has a
certification program for FreeSync, maybe they have a flickering
requirement? (Something like "screen must not flicker if rate increases
or decreases by XXX Hz each vblank"?)

Simon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
