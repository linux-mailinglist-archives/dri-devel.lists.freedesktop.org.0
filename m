Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A021A522B
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 14:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF656E317;
	Sat, 11 Apr 2020 12:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 495 seconds by postgrey-1.36 at gabe;
 Fri, 10 Apr 2020 11:21:02 UTC
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359B56E1D3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 11:21:02 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id D0C895808B7;
 Fri, 10 Apr 2020 07:12:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 10 Apr 2020 07:12:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=luisgerhorst.de;
 h=references:from:to:cc:subject:in-reply-to:date:message-id
 :mime-version:content-type; s=mesmtp; bh=1XCTRzA4r6t+aW/YmemVZF7
 K9mMd/HGoO3EIq2+dA90=; b=qIrPPVsbiwtiPCG914yDDwQbRVGekh653wn5tFg
 3OXdht3GDey5g1KxO9bQPKJBaZjXrLahuzs7uwHaDn1hha4c8tqr9U6h/enmMfmq
 axrVJWAkDeXqxnz5S/s0WX+23JNsmfvxG76MaCu5yoZ/10otB8aw6fJY8I0RJhAL
 UKCE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1XCTRz
 A4r6t+aW/YmemVZF7K9mMd/HGoO3EIq2+dA90=; b=W9Z+DKjhWSrSdyvjUXQWV0
 Ht2PBs1Ju8IyieMn6zSkkE0Ul7b4auQXJoekqKJj2FzKU9A+TGuBoFK1SeMMbtzb
 8oMu2rI+B4LzmSkiLSgoieRYIg+B8B0W2HubEz8VgtrlMAXtwwV8LwPnsaNl7ENf
 Hnjisw0YwgMkCsP9gyq9jSxPZWrZ9Ts2HPNybosCeGMKZtC5AH9R3c92CP8iSrSH
 gHS5Yf6zBUWVLj0ZbW7UWf0jF0G8RyBbIZtZRddWT5nYI7Y5ITHyhHNZMoDcYH6U
 Tdhl71Pqk4drxYS2/9BHw9I+ui37vmZMPZYDw+naFkx8jWWMgcUvkw4fFivbpqgw
 ==
X-ME-Sender: <xms:o1SQXtej93cVqf0lMq7BjSBnI80YT6WTnh_bM3bafOgyIiQWYNJntw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrvddvgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpehffgfhvffujgffkfggtgesthdtredttdertdenucfhrhhomhepnfhuihhsucfi
 vghrhhhorhhsthcuoehlihhnuhigqdhkvghrnhgvlheslhhuihhsghgvrhhhohhrshhtrd
 guvgeqnecukfhppeelvddruddujedrudefiedrkeeknecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomheplhhinhhugidqkhgvrhhnvghlsehluhhish
 hgvghrhhhorhhsthdruggv
X-ME-Proxy: <xmx:o1SQXsJqEEpdAVlBBNOrPjECiypCvsioWJAkkkqB7OV1k6G1cJ037Q>
 <xmx:o1SQXm3GbM5jjQeq5Fw3vlWvqURZgDtwUCKygupmqpZPjSWL5fF5KQ>
 <xmx:o1SQXlY0lL6nr4XO4VhiScv6QkQfeTRa26Q3bZiNQCcnAlci-1NBaA>
 <xmx:qlSQXgnwI9ZSlZ3EtewA6ucmkah78uuNHQkFyCGi-HgqJe16QWXm_g>
Received: from luis-debian.fastmail.com (unknown [92.117.136.88])
 by mail.messagingengine.com (Postfix) with ESMTPA id DA33E3280060;
 Fri, 10 Apr 2020 07:12:29 -0400 (EDT)
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-5-lukasz.luba@arm.com>
User-agent: mu4e 1.0; emacs 26.1
From: Luis Gerhorst <linux-kernel@luisgerhorst.de>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v6 04/10] PM / EM: add support for other devices than CPUs
 in Energy Model
In-reply-to: <20200410084210.24932-5-lukasz.luba@arm.com>
Date: Fri, 10 Apr 2020 13:12:28 +0200
Message-ID: <87ftdboaqr.fsf@luis-debian.luis-debian-domain>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 11 Apr 2020 12:53:57 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, mka@chromium.org, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 agross@kernel.org, daniel.lezcano@linaro.org, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, mgorman@suse.de, orjan.eide@arm.com,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 b.zolnierkie@samsung.com, kernel@pengutronix.de, sudeep.holla@arm.com,
 patrick.bellasi@matbug.net, shawnguo@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Lukasz Luba writes:

> +/**
> + * em_dev_unregister_perf_domain() - Unregister Energy Model 
> (EM) for a device
> + * @dev		: Device for which the EM is registered
> + *
> + * Try to unregister the EM for the specified device (it checks 
> current
> + * reference counter). The EM for CPUs will not be freed.
> + */
> +void em_dev_unregister_perf_domain(struct device *dev)
> +{
> +	struct em_device *em_dev, *tmp;
> +
> +	if (IS_ERR_OR_NULL(dev))
> +		return;
> +
> +	/* We don't support freeing CPU structures in hotplug */
> +	if (_is_cpu_device(dev)) {
> +		dev_dbg_once(dev, "EM: the structures are not going to be 
> removed\n");
> +		return;
> +	}
> +
> +	mutex_lock(&em_pd_mutex);
> +
> +	if (list_empty(&em_pd_dev_list)) {
> +		mutex_unlock(&em_pd_mutex);
> +		return;
> +	}
> +
> +	list_for_each_entry_safe(em_dev, tmp, &em_pd_dev_list, 
> em_dev_list) {
> +		if (em_dev->dev == dev) {
> +			kref_put(&em_dev->kref, _em_release);
> +			break;
> +		}
> +	}
> +
> +	mutex_unlock(&em_pd_mutex);
> +}
> +EXPORT_SYMBOL_GPL(em_dev_unregister_perf_domain);

Ok, so em_dev_unregister_perf_domain() does not support the CPU 
device
and a subsequent em_register_perf_domain() will fail with EEXIST.

Is there a way to unregister/change the CPU's energy model during
runtime without restarting the whole system?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
