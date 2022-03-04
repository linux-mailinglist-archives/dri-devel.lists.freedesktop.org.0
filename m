Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E5F4CCAA3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 01:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C303E10E3C3;
	Fri,  4 Mar 2022 00:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB3310E3C3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 00:16:01 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id f4so5091018qvd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 16:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eCjc4x4By6clCaeAiAFIhXtDZP9qpnoE7G+iXzZ8y04=;
 b=oP3Se4QqoP9oAlQ1HRVSjzyG5E2i34IxROypI6Bz8iIiSEekElY8/BTpuNTyk1HKwf
 G7LkEPxIO5SPYolkl29HrX0Ox50rktrbuHE/KZoQqyyZ1tJAlFmeVxoYHFGEQ363oRhz
 9tD+IEJaGkj6cadV74LDDg52Z4I4om+nAsNfXOsMY2idn/iul+VqA9UBWw28A6N4VLom
 +qwsMv4qn+Uo3rXGbQA0+czOGICIRcUvvdyT6zxOqZm73F6dk9FgBbqu6vVsKwjAeDiJ
 uzugSydM4U8v9MWShFmWMA1PVBrpWbLrdJ0eDQlRjim8O8Xfk69nxx3+yR3Us6QdFQYH
 uWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eCjc4x4By6clCaeAiAFIhXtDZP9qpnoE7G+iXzZ8y04=;
 b=EpV65e3F+V9YXNLzZgwExaR3HWwxKG9zvXdzQljeDr1Lsx86qnsph13NJM5pqglFij
 WTHMRP5KNDlhO0LVniHgPw55t5qVlK5Hn26Wvq4tTKGRsT+g04VSZ2XNUzJzXbelne9t
 rJgGGxJp6VINZvmWaSi/aj21KIZTOVV/wcQUzouQ5/paWg87sAw9CCXTDeYFzN7cGhbd
 lW9HYYFU4M4P4881TAg0nlcdMml9PlkKbNgyVm2mzZEJQ/L0nytRKRuC1OYJr0zTNgiQ
 rFxHAa5226w3h5ca0Ckbc5YF5cSlrcV/zPK2FZ/NU5JQoJJO4je+KsBstrX/KdtuFWHx
 /LhA==
X-Gm-Message-State: AOAM532VX4A7ReJtU+MKJYf527xv/b6r4oSChjsLW/WKJME7brB8RjOZ
 qzR6SoT/GydaZcjgzKuM+tJiyLBD9an8BiEIIF1tEw==
X-Google-Smtp-Source: ABdhPJxum/m+TEt3e7BQD9vNYZDUIpyt+gK4TZ209Fwn4ctVQ9miyXr7mySaKYi3BuSGNSTDSVnqVqbdgDlUxVbPp/Q=
X-Received: by 2002:a0c:d807:0:b0:42c:1ff7:7242 with SMTP id
 h7-20020a0cd807000000b0042c1ff77242mr26194090qvj.119.1646352960853; Thu, 03
 Mar 2022 16:16:00 -0800 (PST)
MIME-Version: 1.0
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJpqkK8q7g8q56rfiOO22ykxgycJTpSJKHuhcqGk05nsVzA@mail.gmail.com>
 <CAE-0n53jGQcn=NThrrW92NL-cry8yrFErdSYTHHEHWW48b3xbg@mail.gmail.com>
In-Reply-To: <CAE-0n53jGQcn=NThrrW92NL-cry8yrFErdSYTHHEHWW48b3xbg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 4 Mar 2022 03:15:49 +0300
Message-ID: <CAA8EJpoEpn2RPByeDkaGPUX+OC7tvbEw4k78Gd+RKs02jpzG1w@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64/dts/qcom/sm8250: remove assigned-clock-rate
 property for mdp clk
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Mar 2022 at 02:56, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-03-03 15:50:50)
> > On Thu, 3 Mar 2022 at 12:40, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
> > >
> > > Kernel clock driver assumes that initial rate is the
> > > max rate for that clock and was not allowing it to scale
> > > beyond the assigned clock value.
> > >
> > > Drop the assigned clock rate property and vote on the mdp clock as per
> > > calculated value during the usecase.
> > >
> > > Fixes: 7c1dffd471("arm64: dts: qcom: sm8250.dtsi: add display system nodes")
> >
> > Please remove the Fixes tags from all commits. Otherwise the patches
> > might be picked up into earlier kernels, which do not have a patch
> > adding a vote on the MDP clock.
>
> What patch is that? The Fixes tag could point to that commit.

Please correct me if I'm wrong.
Currently the dtsi enforces bumping the MDP clock when the mdss device
is being probed and when the dpu device is being probed.
Later during the DPU lifetime the core_perf would change the clock's
rate as it sees fit according to the CRTC requirements.

However it would happen only when the during the
dpu_crtc_atomic_flush(), before we call this function, the MDP clock
is left in the undetermined state. The power rails controlled by the
opp table are left in the undetermined state.

I suppose that during the dpu_bind we should bump the clock to the max
possible freq and let dpu_core_perf handle it afterwards.


--
With best wishes
Dmitry
