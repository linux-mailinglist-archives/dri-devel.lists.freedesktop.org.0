Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2FD4CFF5E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 14:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0633110F2FE;
	Mon,  7 Mar 2022 13:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954B410F2FE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 13:00:30 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id e186so30737552ybc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 05:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cV/iRWpEISoBT8RqYrC9Loyzy60WPxJLdJrpUBpn9N4=;
 b=LVb++RVBZfne8vu4GpNufR3TESTWg0xLaPgW4a8mWdgu+RsfCq0eSp7KjWLVehEZMi
 Nqc9VQ04sWEuTzePC1BAc92teVEUvdGyPyD24J9VgfOlza/1uyEZeVS4Rz+ev0Kg+g+w
 mVMXXPm1QDuom6dMCjngUykQ4yCV1nwKEqJwjVs8PmDIVYk7pJ+0X9Fc1Ucm82OLgzKY
 rFrdY08sjABSAp4mH5xB7Jz6UfirJs2eorbxcisS7cxmYySScStHT7AH6YMGEz0Mv4jA
 x4/UXhyzWP0afg9vP2AQLMwR4es9LiI26n22K0Fn0iAsm4g/NOcto86FXEk64Rn1bgyX
 7uHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cV/iRWpEISoBT8RqYrC9Loyzy60WPxJLdJrpUBpn9N4=;
 b=CwqMns+kX+OjkCeHQBdqUxWVYc8K8t5sUrr67uOLDG5jAz1/ac+PZRejOlVGWlf/4S
 aBXZttzFedV93H5kL0xz/J8SmXarOvXBtuc5tnyZjfkrDhnCXCVXgnKi3HQkEQ+brZ4b
 6jBAE+/93SzLsfRH1jZnPy9txg22wKy6zYhb/Q24ehfekCpUXLbWxs8a1fvBoflGQaYV
 dlflWjC9s2zRWWVBy5OJrvBsXL8zTwabw3CRpSj8DMHnOodv/gSA6xozAmEM1rvdqgxH
 FvUWhMVx7K2VLwwOGIHci+frr7zsRRH8xFYdF/xEDsQiroNDt+VBdku1MVJQoyEvlLw7
 mJQQ==
X-Gm-Message-State: AOAM533Vnv2MKl+cN7y3sOFlhl10yIpEMzAjbKTxvgHWchcvQny4WSp9
 nchuWddxz24AlZAyaSSsWs2Oi5H0KPF+t2Ljy1YZ5g==
X-Google-Smtp-Source: ABdhPJz7y/I54piNlQLkLmG1TBL8cO2TtZqqA/3TeporXhO/Ll4av+9Oeyrz2ZsqrqwcxxAf9U2afKUDEFHXjPyXHVY=
X-Received: by 2002:a25:5090:0:b0:628:b76b:b9d3 with SMTP id
 e138-20020a255090000000b00628b76bb9d3mr7938482ybb.128.1646658029569; Mon, 07
 Mar 2022 05:00:29 -0800 (PST)
MIME-Version: 1.0
References: <20220307091702.378509770@linuxfoundation.org>
In-Reply-To: <20220307091702.378509770@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 7 Mar 2022 18:30:18 +0530
Message-ID: <CA+G9fYtXE1TvxtXZPw++ZkGAUZ4f1rD1tBkMsDb33jsm-C1OZw@mail.gmail.com>
Subject: Re: [PATCH 5.15 000/262] 5.15.27-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Netdev <netdev@vger.kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 lkft-triage@lists.linaro.org, patches@kernelci.org,
 Hou Tao <houtao1@huawei.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 f.fainelli@gmail.com, shuah@kernel.org, jonathanh@nvidia.com,
 linux@roeck-us.net, slade@sladewatkins.com,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, pavel@denx.de,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org,
 sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 7 Mar 2022 at 15:07, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.15.27 release.
> There are 262 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 09 Mar 2022 09:16:25 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.27-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h


Following build errors/warnings noticed on arm64.


arch/arm64/net/bpf_jit_comp.c: In function 'build_insn':
arch/arm64/net/bpf_jit_comp.c:791:21: error: implicit declaration of
function 'bpf_pseudo_func' [-Werror=implicit-function-declaration]
  791 |                 if (bpf_pseudo_func(insn))
      |                     ^~~~~~~~~~~~~~~
cc1: some warnings being treated as errors


drivers/gpu/drm/mediatek/mtk_dsi.c: In function 'mtk_dsi_host_attach':
drivers/gpu/drm/mediatek/mtk_dsi.c:858:28: error: implicit declaration
of function 'devm_drm_of_get_bridge'; did you mean
'devm_drm_panel_bridge_add'? [-Werror=implicit-function-declaration]
  858 |         dsi->next_bridge = devm_drm_of_get_bridge(dev,
dev->of_node, 0, 0);
      |                            ^~~~~~~~~~~~~~~~~~~~~~
      |                            devm_drm_panel_bridge_add
drivers/gpu/drm/mediatek/mtk_dsi.c:858:26: warning: assignment to
'struct drm_bridge *' from 'int' makes pointer from integer without a
cast [-Wint-conversion]
  858 |         dsi->next_bridge = devm_drm_of_get_bridge(dev,
dev->of_node, 0, 0);
      |                          ^
cc1: some warnings being treated as errors

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log [1].

--
Linaro LKFT
https://lkft.linaro.org

[1] https://builds.tuxbuild.com/263ZKyWWLLcPGRbiZwIEZw3wvXX/
