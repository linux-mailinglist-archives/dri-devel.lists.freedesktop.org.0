Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441DDA6B7CF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 10:42:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB3A10E714;
	Fri, 21 Mar 2025 09:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y6uW0czV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B639D10E714
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 09:42:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B5C07615CD;
 Fri, 21 Mar 2025 09:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E4FC4CEE3;
 Fri, 21 Mar 2025 09:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742550138;
 bh=LsGqQfLW4xmvHqOWZQoTZqI23HLjYTqmgqYypkSYSEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y6uW0czVMc8Z64eLHZNEzJPzGZMlVTv7d/9qCs5ibzDcRxSCAJ6KlwPyCprIRYwUJ
 eXHqUWYoWtT7Y7Ba/9pUHoC/T7r/i/kJPSyYVbGK+zjOs4UEWcXDgH746/o+VlNzsW
 k1jO9zPzgohzGzD8V9XG09LiGSXJrSYsuRvpR0Sj3OeZd3Bt8Mzs9SI8IDECa+kY93
 PhtJfEFiJHCMyOLIPzTHfohXAtd1YWsIehQ7Mf10nm9+PT+e0rJDZFyc6/Iymhd6dj
 fUQdw0zdM+yB+zEC+6Q5vR/EsFuaRKQjuM+qVA5AzoNGxVAm3axRMYgZfk8FMpVldn
 FOTynhNcsJ3rw==
Date: Fri, 21 Mar 2025 10:42:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, srinivas.kandagatla@linaro.org, 
 amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 quic_kuiw@quicinc.com, 
 quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 3/3] dt-bindings: misc: qcom,fastrpc: Add GPDSPs label
Message-ID: <20250321-anteater-of-immense-flowers-53b2c2@krzk-bin>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-4-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250320091446.3647918-4-quic_lxu5@quicinc.com>
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

On Thu, Mar 20, 2025 at 02:44:46PM +0530, Ling Xu wrote:
> Add "gdsp0" and "gdsp1" as the new supported labels for GPDSPs fastrpc
> domains.

Why? What problem is this solving? What is GPDSP and GDSP? Why they
differ? So many questions, so little explained in commit msg.

Also, bindings are before users.

Best regards,
Krzysztof

