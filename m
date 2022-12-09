Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCFE648DE5
	for <lists+dri-devel@lfdr.de>; Sat, 10 Dec 2022 10:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A7610E0A9;
	Sat, 10 Dec 2022 09:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D6610E53B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 15:22:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1670599341; cv=none; d=zohomail.in; s=zohoarc; 
 b=cxmKipMp6SYO/LcHtw1yx8o9hDdhtm94Ju1EQ6Ss/yZywEWpZduCBV9dfx8UzUy2wgQFRaRtnD9CCV+K80AOnLJamGQ2vzPzk1GbPtBaEv0EeOPNxProTCXQLim0koxDmLxX90DhDo8nGX1WAazkCncOajlEC3IWxGp02ngaqB0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1670599341;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=6JPEYvBFFf3frgLUC1Ir8L8ve0YtqwwoZbm6TNaJ1fI=; 
 b=dMqA55gQ9O/7w/4TlhmIZqMI3Ci5TlNtthgPBxJnk9QiZWStc8wwB9y0/m8ql6+U3gbgB0KenQjxkKQxbKVEzn4AYAmREQX5vBxMi8iup/7EdST3MX+eJMsM5+nQY/DKGiEpM8jljNvWPBbY2HeQB6y5+sT3EgCv7PA//AnUPHs=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670599341; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=6JPEYvBFFf3frgLUC1Ir8L8ve0YtqwwoZbm6TNaJ1fI=;
 b=FaLFXGicv7TwQVH+oouXgYrIkpnBsOJEcZjE3nof1/IvXehEnxxILiA1AnoxpyV4
 hctCv30YzcsT3mj2zJcc/UOkdv1/FphH3MFkDBOU7Gf4D6fA90gi4F68OwJvSRkk4ue
 QdQCJpRTbOcgZzJR9nDy+REjln8TmonL9SEPIIK0=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1670599330020835.4880674962899;
 Fri, 9 Dec 2022 20:52:10 +0530 (IST)
Date: Fri, 09 Dec 2022 20:52:10 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "syzbot" <syzbot+6f7fe2dbc479dca0ed17@syzkaller.appspotmail.com>
Message-ID: <184f77ac8d0.791edf3b143932.142182656112496550@siddh.me>
In-Reply-To: <0000000000005752c105ef640d84@google.com>
References: <0000000000005752c105ef640d84@google.com>
Subject: Re: [syzbot] WARNING in drm_wait_one_vblank
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Approved-At: Sat, 10 Dec 2022 09:20:55 +0000
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
Cc: syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 09 Dec 2022 17:41:23 +0530, syzbot wrote
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
I keep getting "ERROR: Out of memory at tomoyo_realpath_from_path." and
cannot reproduce the crash...
