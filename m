Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 888157716D1
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 23:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED74310E122;
	Sun,  6 Aug 2023 21:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6D010E083;
 Fri,  4 Aug 2023 13:12:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1691154707; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=N8QPmQRPBmmcwZIXzOCbMrg7bVt0ORNpLTpvCJryhj7//qYYWLNxviKvRY0Uc1y7mO
 O+y/HHmLT+Z2nuQh6UmUN7eh+SjSta9Uts5T7xcXrpWnDruWWUthLSmvg8RLpHraxkNL
 wtOTaRAzbGlHRWjRL7sOdU9Ny01ImWiexV6QwMHunONU/1KajmI5jBH7kBmT7dP1ZjoN
 vifOD8siIS/btzIUAs+BHwV0aiZP+s3i16vKDSFM0e6EauqJRsxr6ULN9vvY8mseUZ96
 JjkJeYHrYz0vTKAc1DP2onVkTFqh8cgej0tx5Ret+LwoKDwm/ONEoOYC6y3KveFoBdED
 /WEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1691154707;
 s=strato-dkim-0002; d=strato.com;
 h=References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=vIQtdrkQZ/mwLTpAq2v2mFxTNyKyXCo1I0JLGZ9R+q4=;
 b=GtvqbyQ2722eGk83jV8pInbWiusFZOCFOyz6Queu8XBRYEIAHgSJTneHk0DPSkiJvw
 5cXW7c57ZIQI4/scN3ATvYLfuB3YcqzcuyuLqxIxkXMbeHvmXTesodJfDXxuW5hYYh6u
 BcX5YkQSDBigOA/6a6PFAj89RcS1iUyDsZZ2Qj9qoRN+u4PPOJFgaNhQGoPwUJWR7aUm
 8zcXXNG1WUAXSsbfgHisHNN0szSLiNv8748MfYYlmO4A/Wsv8sp6ozFM9OvXmeZLLHJH
 Nn6WKZ1IGZojwAg2WXXzeJp8IHJGOmuSQqBLRyBTE4wr2pLGV89+k59u7uFE4z4hGMY0
 9IOA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1691154707;
 s=strato-dkim-0002; d=kravcenko.com;
 h=References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=vIQtdrkQZ/mwLTpAq2v2mFxTNyKyXCo1I0JLGZ9R+q4=;
 b=rd1gi8x2/bMLWP6RGMuN/ax6souAbf1W7OX7tL1fyNyFYzmwHEy6VPUVCMYp/E4kr3
 bCrQP1Q1maDiaVflqQnVnSaePi4is1lkam1sk/iO7JFzntUK7VtICcCFfw+FHVIchRdL
 5sehAO0RJI8dBK5awrYdt576txXpSyzhB6YWptkBXTEdXooANyRh189WSh81L7au79xi
 V9yj7S2gXQW4n541pOYB1/HNpnymeP+stmXQTbVIICWDMITS1jNFwPTjzeyocYeF4EUe
 xCriocqeIgby3vj9xfVuKX9GgG+6DFVwmPoEdYttSshJIuvh8p8x9dVU4Lbji6J479+X
 ALoQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1691154707;
 s=strato-dkim-0003; d=kravcenko.com;
 h=References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=vIQtdrkQZ/mwLTpAq2v2mFxTNyKyXCo1I0JLGZ9R+q4=;
 b=fhKFqYGec4nOjbDEUSIgjyChh0R4FRKzjV76fRoQcarog/BgHpCEs02Ar9kYSdxg3K
 BNDFlA8wcoXuyV40FFCg==
X-RZG-AUTH: ":I2AFc2Cjaf5HiRB0lhnvZ9elhwku56KjVuxY6AZJWRy8C0aEhFGbVIvMVnbXlOZqFTX/PnlW"
Received: from duane.cam.uni-heidelberg.de
 by smtp.strato.de (RZmta 49.6.6 AUTH) with ESMTPSA id dd2654z74DBlWx7
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 4 Aug 2023 15:11:47 +0200 (CEST)
Date: Fri, 4 Aug 2023 15:11:46 +0200 (CEST)
From: Olaf Skibbe <news@kravcenko.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: nouveau bug in linux/6.1.38-2
In-Reply-To: <CACO55tvu4X3u8K-FGUeN2CBw1BnumRPBNEEqjn+EPzNCCCQYyg@mail.gmail.com>
Message-ID: <b12e2b00-de18-df9c-eb4a-c6704aad2c97@kravcenko.com>
References: <20be6650-5db3-b72a-a7a8-5e817113cff5@kravcenko.com>
 <c27fb4dd-b2dc-22de-4425-6c7db5f543ba@leemhuis.info>
 <CACO55ttcUEUjdVgx4y7pv26VAGeHS5q1wVKWrMw5=o9QLaJLZw@mail.gmail.com>
 <0a5084b7-732b-6658-653e-7ece4c0768c9@kravcenko.com>
 <CACO55tvu4X3u8K-FGUeN2CBw1BnumRPBNEEqjn+EPzNCCCQYyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; CHARSET=US-ASCII; format=flowed
Content-ID: <f4af53b7-f8ea-1825-731c-cb2bd0e71968@cam.uni-heidelberg.de>
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 06 Aug 2023 21:43:47 +0000
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
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 nouveau@lists.freedesktop.org, 1042753@bugs.debian.org,
 dri-devel@lists.freedesktop.org, Thorsten Leemhuis <regressions@leemhuis.info>,
 Ben Skeggs <bskeggs@redhat.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Aug 2023 at 14:51, Karol Herbst wrote:

> How are you building the kernel? Because normally from git reverting 
> one of those shouldn't take long, because it doesn't recompile the 
> entire kernel. But yeah, you can potentially just revert one of one 
> for now and it should be fine.

I am using the `test-patches` script described here: 
https://kernel-team.pages.debian.net/kernel-handbook/ch-common-tasks.html#id-1.6.6.4 
This worked for my limited knowledge (first kernel I ever compiled).

(On the occasion a maybe silly question: am I right assuming that the 
kernel has to be build on the machine we want to reproduce the bug on? 
Otherwise it could use much faster hardware (running also bookworm).)

Cheers,
Olaf
