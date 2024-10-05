Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE46991810
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 18:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED1410E04D;
	Sat,  5 Oct 2024 16:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eLMvt9Sr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EAD10E04D;
 Sat,  5 Oct 2024 16:04:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ECCECA406D3;
 Sat,  5 Oct 2024 16:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE239C4CEC2;
 Sat,  5 Oct 2024 16:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728144255;
 bh=3kAl7AjYTqaiWlIoDOVi3hSGnrwStWTjPrjLj2tI724=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=eLMvt9SrhuO+7e/pS/H9lQjX2AqV059uevEzfrx+Dw+iuWn+LOJbwklOMYNL+a3QD
 zoDlXuPx9dWYCDbmMdEZ6GPvMZPl2UeOwym082tTGhnmbwlsTT4RTHXdxXiJl/yDrl
 f8SU9tvLHwjnmJ+FcMDjgiKzomkn3GDpjCLnzhURhh5c9X/ZYJz/A1tknReLKn6QNR
 xsV49DEm6eWuiOjUE1qbpPapztLqHTtfvXkpWiWpQSxy3NqZB0BMFbSMNhDE2445CZ
 e0Lp477VZJ8v1xun5OhT0MF7asrTfTf0v2JrxyHLA3m4y/IPvwaOWaka3vE9gqeC4J
 BvqcMf7nPW56Q==
Date: Sat, 05 Oct 2024 09:04:11 -0700
From: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Danilo Krummrich <dakr@kernel.org>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D=5Bnext=5D_drm/nouveau=3A_Avoid_?=
 =?US-ASCII?Q?-Wflex-array-member-not-at-end_warning?=
User-Agent: K-9 Mail for Android
In-Reply-To: <45560975-7215-4205-8d3b-a01009c9b4f5@embeddedor.com>
References: <ZsZLFS1CsHkKjw+C@elsanto>
 <ef5a8e6d-cb97-4872-901c-cf4bbec23be6@embeddedor.com>
 <30530165-0ea9-4f02-9d8c-e8abc9eda5a7@kernel.org>
 <035ae74b-5df5-493f-9835-02c1c30ccfcc@kernel.org>
 <45560975-7215-4205-8d3b-a01009c9b4f5@embeddedor.com>
Message-ID: <81E112F0-51CA-4171-8DA7-59EC8AE14510@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>




>On 03/10/24 12:36, Danilo Krummrich wrote:
>> On 9/13/24 12:23 PM, Danilo Krummrich wrote:

I am reminded that I should check all my MUAs to render the date as YYYY-M=
M-DD so my brain doesn't explode when I see people "time traveling"=2E ;)

(BTW, what MUAs do you both use? I use Mutt and K-9 Mail, and I need to ch=
eck the quote prefix settings in both=2E=2E=2E)

-Kees

--=20
Kees Cook
