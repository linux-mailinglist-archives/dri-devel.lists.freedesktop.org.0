Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5798F7FB1DB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 07:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726DB10E425;
	Tue, 28 Nov 2023 06:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BBF10E424;
 Tue, 28 Nov 2023 06:14:35 +0000 (UTC)
Received: from [100.124.219.30] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0511B66072A4;
 Tue, 28 Nov 2023 06:14:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701152073;
 bh=ZG0Tm8rmeYeyaVrNuXAmLFqred76mjRjFtnoj7e50pc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ARfjCT2z30i9fMFc6uRARQ/ghAqWw4A2tIgSIb9WZ6Tjo411B4URSZP0mgHsu/rdv
 iti4J2nZMLwPI1R4S8ZpuxTPMFs7LFlGn77OoxO5JQitCNI4VRKbho9RLqPN5eOpiH
 kkrj+7yDHLMydfsb6QfXuuGUBivkzDe1RuU7bcEKYPi+FFFqiM0A7TORq0WlqkMbFr
 KFyyMTKs97wP8t2fa3L/mItY5ZsmROhydQRASx4nh7Jr5YEXIfWi9ZbVcsM/oJvFkO
 4lJGtp6uWQqY86UdD2EfTjIsiNGyhvnOT76+Csksn34xbEmzSC+cCuLlun0VGVp6rj
 cYBam44Q0sE8w==
Message-ID: <50a9f061-e1d3-6aca-b528-56dbb6c729d9@collabora.com>
Date: Tue, 28 Nov 2023 11:44:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] PCI: qcom: Fix compile error
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20231128042026.130442-1-vignesh.raman@collabora.com>
 <20231128051456.GA3088@thinkpad>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20231128051456.GA3088@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: daniels@collabora.com, linux-pci@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, helen.koike@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mani,

On 28/11/23 10:44, Manivannan Sadhasivam wrote:
> On Tue, Nov 28, 2023 at 09:50:26AM +0530, Vignesh Raman wrote:
>> Commit a2458d8f618a ("PCI/ASPM: pci_enable_link_state: Add argument
>> to acquire bus lock") has added an argument to acquire bus lock
>> in pci_enable_link_state, but qcom_pcie_enable_aspm calls it
>> without this argument, resulting in below build error.
>>
> 
> Where do you see this error? That patch is not even merged. Looks like you are
> sending the patch against some downstream tree.

I got this error with drm-tip - git://anongit.freedesktop.org/drm-tip

This commit is merged in drm-intel/topic/core-for-CI - 
https://cgit.freedesktop.org/drm-intel/log/?h=topic/core-for-CI

Regards,
Vignesh
