Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 416B9677669
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 09:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F51110E316;
	Mon, 23 Jan 2023 08:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 909 seconds by postgrey-1.36 at gabe;
 Sat, 21 Jan 2023 20:41:34 UTC
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1ABD10E448
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:41:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1674332779; cv=none; d=zohomail.in; s=zohoarc; 
 b=KlSYtUWHR09SZYVKxLHvoiTbj8sQbGLNN+SxzBsjkWsfr1wUUi1rKQ8CJ2SclclUmdT22ZMjMdro4toijUtgDI44NEkpkt7eitZ/e+U3d/X7QBTA+48yKui5vMVEcCk+1oYurvFgR2c7MT3dkgmqhWE1QdYfqAoHAcDdWeq5DiA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1674332779;
 h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=wdwoyyL/byvLeADOl1a95d/xA3wbyX7kNb5g7/2LrU8=; 
 b=Mi1iK5W+iRRDpdfTFeKkVP4kIeXDQTShBEyMns8VnVtc4w8npJY7ztxF9LFbPiyDbi5Qxhkp4D3yRw2ZJl4/WEzc29j5fxv+QASSMtOQW0e1spDEcHk1iEdzKSOOui7XmH/HXAbO10zzZUI7vmKpofjvOeNIuImdEjHJ/oLspRk=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=vaartaa@siddh.me;
 dmarc=pass header.from=<vaartaa@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1674332779; 
 s=zmail; d=siddh.me; i=vaartaa@siddh.me;
 h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=wdwoyyL/byvLeADOl1a95d/xA3wbyX7kNb5g7/2LrU8=;
 b=gKZiGPtrgfBz75surAwEwzT1Kl0E6s//c+k+MABkf0aL6gkoIB7pJuqxKLzXncGY
 DUANn7Yl0eP7LjzfOeWHcv99/moANqNlN55sCs/HuPDoa3NyNgcOGiJBtMV9+hz4Wo3
 By2lYcjSXRWRAqxKdq9LodH1DXB9tAsrwiKeIhCo=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1674332768017752.9427347886934;
 Sun, 22 Jan 2023 01:56:08 +0530 (IST)
Date: Sun, 22 Jan 2023 01:56:07 +0530
From: Siddh Raman Pant <vaartaa@siddh.me>
To: "evoc" <evoc@foundation.x.org>,
 "dri-devel" <dri-devel@lists.freedesktop.org>
Message-ID: <185d60286fc.132d37c8232094.4969738854762246851@siddh.me>
In-Reply-To: 
Subject: [RFC] Proposal for X.Org EVoC
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Approved-At: Mon, 23 Jan 2023 08:39:49 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

I want to participate in X.Org EVoC as I am looking to learn and
contribute more to the Linux kernel.

I have made a draft proposal at https://gitlab.freedesktop.org/-/snippets/7366.

Please take a look at it and let me know your thoughts.

I am also looking for a mentor. I had tried earlier to contact some
people asking what & how regarding EVoC, but they were busy. I also
felt I should have communicated better & structured some information.
With this email, I'm attempting to do the same.

Please let me know if the proposal needs changes, or if it is full of
nonsense, and/or I need to improve more.

Thanks,
Siddh
