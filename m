Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 272E036CD09
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 22:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3192A6E5D3;
	Tue, 27 Apr 2021 20:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596CF6E5D3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 20:47:29 +0000 (UTC)
Date: Tue, 27 Apr 2021 20:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1619556447;
 bh=iNcxy6KeU56DJXlNVjMd1STmdFsi58Acv0tAfYq6lLc=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=CJMpXDG25hor78xB1ygwP8ZnX+mbQaK/T71eNdXzXdQufop6Fv8EuawPKa9L08jcg
 h4DjMalWdCdW8XhiV4ZZAl0JE30Liast8hIwkimJMXgz2wF7q9vhzlbYERE55oFILm
 wJSuACzjpWFx5kM2uKYrRJtomnlOeDFSRqELOetQ=
To: dri-devel@vger.kernel.org
From: Caleb Connolly <caleb@connolly.tech>
Subject: Display notch support
Message-ID: <f8747f99-0695-5be0-841f-4f72ba5d5da3@connolly.tech>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Cc: martijn@brixit.nl, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With many more non-desktop form factor devices landing in the kernel, 
we're starting to run up against some limitations. Notably devices with 
display notches, cutouts and rounded corners.

Given that the DRI subsystem already deals with physical display 
properties like panel orientation which is fixed in device tree, it 
would make sense to also define other properties like parts of the 
display which are obscured there too. This can then be read by desktop 
environments and UI elements can be suitably adjusted.

Android already deals with non-square displays, however they also keep 
the device configuration in userspace: 
https://developer.android.com/guide/topics/display-cutout

A solution to make this configuration generic and exposed by the kernel 
would standardise this across Linux and potentially Android too which 
would be extremely beneficial to the mobile Linux community at large.

Does this seem like a feasible solution to solving the notch problem and 
avoiding a situation where every compositor have their own method of 
describing cutouts and rounded corners?

Regards,

Caleb



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
