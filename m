Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C4FBB3E44
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 14:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E2610E19D;
	Thu,  2 Oct 2025 12:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DBgcxDzp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AAD10E19D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 12:30:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9F2EF60588;
 Thu,  2 Oct 2025 12:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C385EC4CEFA;
 Thu,  2 Oct 2025 12:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759408216;
 bh=HIVEUIFu/QO+ILTSmG0vpZJp2DtvKkSaZu/TUFYKn24=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DBgcxDzpH/Ih1vVjUZpk0yhp+5M5aUMKazEAZqKEsc0sKXBca6nZyHiyHo+zNuE96
 p8ZYP/WBYmbixV71O/AwE8EDDu/brabuhdzvLGFJgnUM26JFi1rQpqo8ryURs7S3Cc
 VzDAXa44f11CejqpAIJMmtHJl75qBZXnjlpS9mUNOvdkG3CAHLyFaZWdV4gQSb5B+d
 R+yUMk4v9JRITucUrtGUMvsvCUL5LcJCqHuumiImms6qdJXsKaPbHG+fcpn+NCmWhm
 0gJ4LPxLOl+Z6RCGL1yeOjXR4RkNF5AOpvjDAL53TacPuorFSEUTTCGKUOx122SSqL
 YUn1uPR+dzz/w==
Message-ID: <e2eeec46-cc0e-46e8-8069-085fbd06afe3@kernel.org>
Date: Thu, 2 Oct 2025 14:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the drm tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>,
 Alice Ryhl <aliceryhl@google.com>, Andrew Morton
 <akpm@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Vitaly Wool <vitaly.wool@konsulko.se>
References: <aN5qmhC9tUOCNjed@sirena.org.uk>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aN5qmhC9tUOCNjed@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/2/25 2:05 PM, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the drm tree got a conflict in:

(I think this was a conflict between the DRM tree and the MM tree already before.)

The resolution looks good to me, thanks!

- Danilo
