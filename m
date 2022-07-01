Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9FC563AE7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 22:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A40418B318;
	Fri,  1 Jul 2022 20:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0F518B317
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 20:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656707152;
 bh=oA6y+SK8FlTxLms9vHVELuWXS3dG5C4vOJ9qnM6h38g=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
 b=ZK43zNdj0nxSkJtRc9DcRs3tAQCt8LwDdq+jHrO1PbBG6vd1sodBVI7bft/w/1g4E
 ATL6IY797lmZ/d+5966DLBwJO9E9sQHTOXb5R3dwC5hkfuymwsDk/3kNDQ2sQMT2UQ
 KYPViLOdy0Kg/rbkHnrE10mXBLtjPEe5CVT8r414=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.182.192]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6UZv-1o0TSD0Lmb-0070hx; Fri, 01
 Jul 2022 22:25:52 +0200
Message-ID: <593bd3f3-901d-3374-30ff-b1c5d24d5af9@gmx.de>
Date: Fri, 1 Jul 2022 22:25:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/4] fbcon: Fixes for screen resolution changes - round
 2
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
To: geert@linux-m68k.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org
References: <20220701202352.559808-1-deller@gmx.de>
In-Reply-To: <20220701202352.559808-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:96LBxG8R0vUB2OY7vEtbOQZBxj7XsI1EK4QdOk8sOb3dpbJcnlJ
 RqkGdNBnFDPnyR4t49rhSAZkFGXxpcxqqx3hx16zY510EOJGflEuefqWS7uf5PmDWkhhdGs
 Cw17AyAy8EhfI2H0/rO3w8nRl3XnJNjhoxFZHe8qFBI1bbb6uP/cZ6Pq2U77XLLVIoq6Yew
 MPvjE2mzoizqIR3i+jsrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:G/nhvvvuFqs=:4yvNC7RnY4NTGDr/uiTCJL
 QHyq/EwO3Xx4QKdlB2QbRi6zh4lq+bpLeOvA0vFQe2hUvhQ+SNioUoVSfrt2e7POwU5lLHZvP
 4SE+5vRZZllBkSyrXzfxV+gyL8pyTP6+9YKZjJtl3aRek94+pQEBMNDJn3ukYSJK9mvTu2HFU
 HBXC5RybuLTaZUGO2zTuyygUUJb+s8l6OCqFWzhA55LwTFNUrNTjnCOGfCX46dHOEBfffbjFL
 HAdE/WLgYSR6+p9MyQRRnQq9vIrBjDZ0rzwu5Wtbu3ZZv8/UG6a6m3klxYPNt0B44Azf6eB5g
 7WqBKuG0d5X+48a6IIshfb/A69i0Ayup6dyiul5aO3p4Yhli+VbwbrryIilU6sD+rE0fL9iMg
 8RbrmRVo6pZ/xon6y6Bs7/ADHNuag11JSFoiBAllCSzjzEmpWwOEedlMTTYaHQ3z3nq8T9HQk
 +RPNQWdOUfAmS3mB51kCltriY6cYvMz0nEDy6QfkPmaVeY8z5T0dLh8pKYiwJe8FbEQRZP7uX
 cpqRPw0ssP3q9OUGgI36IaLEQDlKrFC8QIapz238dyE4q35oApOKdlirwqva98qxHzafyZKYW
 dlTAW2VW09PKcUuSZRPkHrJ9G5in3Ap+TXYXd+bcwUkqNhva/eTF6x0oQrc3un5GG/dwu4BIQ
 a8Y+7zQgkQH3nIHZZu0QboeZwy4bs647rQvj93AiV3oKUMGMt0irehQ4BTM5yv4bSskLdn7Hf
 5msPtQT/c1ai+zmj5RNvhLbZNiHovsMGeKXlAQ6f6vJyiz+gMSbZqHK3Fg/FExCvn1Zu8WGLD
 GSev4DHh1oPW9WVYl5SBeDMD/18dbLg1gUBwvg4Xr1AMM6vE/WuJv/hwdlJU3+7dbsEfGpmA4
 xFscwSzd2V1fIEMvC+2Ss4RXF5hjS4IySCvxLDU6EpsjdHjtCfaaLS1QFShHXmOJI4rjFBxbS
 rAlpTSgPrMdRrc0B29tjoOFDmpfRDI46Rum5dUx8edTipWH8fqEET7ursexrJKDQHhaG2JQdj
 8ui2SHvkJdVzX3SLXtsdQkjjtHJYjadsj9OLJNemixF6YKug26sU5poIdC2eDkEH9wxUvDWdR
 HtvZsSwn9j38pzlD8OSw8RtNk7a3ZP3bOuAfbzyvaBhrMvxryeFQeP5SQ==
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

I resent this v2 patch series - this time including patch 4/4.
