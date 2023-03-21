Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3336C3564
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 16:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C3510E22F;
	Tue, 21 Mar 2023 15:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E0E10E22F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 15:17:24 +0000 (UTC)
Date: Tue, 21 Mar 2023 15:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1679411842; x=1679671042;
 bh=LTEB3FuiviJxS7q+C+33AcrILlbLHKnW5HmM0QT0P7k=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=MKfPt4ReCkZTVC0Idy2Z34WblBcMT2lZ34S4w+6o8mz15GZ4KszvSTwl9Og5zsQY9
 4RwraqKJglrBiQw2Bf3FHaHDtKwCEbZJ77llmYVQSRaxnPWBnPeeiD0sUfBQvcb8kd
 ttU+NC8KsNi9i/DXn+e76ou2uQdauROLH+9H6gWcUMFgYdaJFuIrzj5T8KBcy08Kfe
 +yBKAVSNrvLN3YtR49Q9l9HE1Y86L76w9G7Qd8hw470L817Cf/sGSOpa8VX3YtsXrj
 g85IACZlE+QrTs2PUpnfsDrJmt+c5VQAeSaPn9C78ILqEo/ecpkD8hf+toM2FisCCi
 SmXnnZo8cdCFA==
To: Daniel Stone <daniel@fooishbar.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: display band (display area vs real visible area)
Message-ID: <Wu3F34S8yHRQHw1uxPpSx7FFhBlmSuniHow9LOwTGRKoc_drJ_XJpaLWvowCx8D2TVjZrUsCb4Wd9Pokgk8HetZsEwGhnC8DZWEL_A9n9NM=@emersion.fr>
In-Reply-To: <CAPj87rMnr343w+Nm3pZ-pF-y1LXdyzcMOXUxkid2kgViRaNY9g@mail.gmail.com>
References: <CAOf5uwkDb=pkEV_qSshA7PnSxCV82sEwrmivAZhth48ae0S++g@mail.gmail.com>
 <87ileu8jwh.fsf@intel.com>
 <CAOf5uw=g1mU1F=kD6M472LRaTWa2B=Sry4GDGXxDApoZknLfeA@mail.gmail.com>
 <87cz528hzk.fsf@intel.com>
 <CAPj87rPPA9oYkZyQ=Y3MRuyJUN71WHDWHpdaRUvuXAxFSLW5SA@mail.gmail.com>
 <87355y8fzk.fsf@intel.com>
 <CAPj87rMnr343w+Nm3pZ-pF-y1LXdyzcMOXUxkid2kgViRaNY9g@mail.gmail.com>
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
Cc: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The thread is:
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/issues/87
