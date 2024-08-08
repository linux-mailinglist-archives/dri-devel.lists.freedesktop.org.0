Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3E894B907
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 10:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5EF10E1F1;
	Thu,  8 Aug 2024 08:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FPIV4LW0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552EE10E1F1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 08:30:48 +0000 (UTC)
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi
 [91.156.87.48])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE4AE581;
 Thu,  8 Aug 2024 10:29:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1723105793;
 bh=iw8pXmLylE4KGP42R3MzLrnRBWr85UiBhxBLckD70Uo=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=FPIV4LW0nQkirIWclJ0Gw3AOFSdLT4qp3YNkwRD9MenO1ZE9QQ22vG24wTMCVNp/j
 tSGAX9XBcwqtDTJ+J05WeqFWx3nfifFa71ljaz7wMURugaAfdI29dhRCmckRgYiDuv
 u89HVnwy/iaXaSfr+iSIS6hosvs9TLJJFhqH5fUI=
Message-ID: <49d736c4-1964-4f51-a951-6e98319181c2@ideasonboard.com>
Date: Thu, 8 Aug 2024 11:30:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] of: property: add of_graph_get_next_port_endpoint()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
 <87jzguw8ln.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org
In-Reply-To: <87jzguw8ln.wl-kuninori.morimoto.gx@renesas.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/08/2024 07:58, Kuninori Morimoto wrote:
> We already have of_graph_get_next_endpoint(), but it is not
> intuitive to use.
> 
> (X)	node {
> (Y)		ports {
> 			port@0 { endpoint { remote-endpoint = ...; };};
> (A1)			port@1 { endpoint { remote-endpoint = ...; };
> (A2)				 endpoint { remote-endpoint = ...; };};
> (B)			port@2 { endpoint { remote-endpoint = ...; };};
> 		};
> 	};
> 
> For example, if I want to handle port@1's 2 endpoints (= A1, A2),
> I want to use like below
> 
> 	A1 = of_graph_get_next_endpoint(port1, NULL);
> 	A2 = of_graph_get_next_endpoint(port1, A1);
> 
> But 1st one will be error, because of_graph_get_next_endpoint()
> requested "parent" means "node" (X) or "ports" (Y), not "port".
> Below are OK
> 
> 	/* These will be node/ports/port@0/endpoint */
> 	of_graph_get_next_endpoint(node,  NULL);
> 	of_graph_get_next_endpoint(ports, NULL);
> 
> In other words, we can't handle A1/A2 directly via
> of_graph_get_next_endpoint() so far.
> 
> There is another non intuitive behavior on of_graph_get_next_endpoint().
> In case of if I could get A1 pointer for some way, and if I want to
> handle port@1 things, I would like use it like below
> 
> 	/*
> 	 * "ep" is now A1, and handle port1 things here,
> 	 * but we don't know how many endpoints port1 has.
> 	 *
> 	 * Because "ep" is non NULL, we can use port1
> 	 * as of_graph_get_next_endpoint(port1, xxx)
> 	 */
> 	do {
> 		/* do something for port1 specific things here */
> 	} while (ep = of_graph_get_next_endpoint(port1, ep))
> 
> But it also not worked as I expected.
> I expect it will be A1 -> A2 -> NULL,
> but      it will be A1 -> A2 -> B,    because
> of_graph_get_next_endpoint() will fetch "endpoint" beyond the "port".
> 
> It is not useful on generic driver like Generic Sound Card.
> It uses of_get_next_child() instead for now, but it is not intuitive.
> And it doesn't check node name (= "endpoint").
> 
> To handle endpoint more intuitive, create of_graph_get_next_port_endpoint()
> 
> 	of_graph_get_next_port_endpoint(port1, NULL); // A1
> 	of_graph_get_next_port_endpoint(port1, A1);   // A2
> 	of_graph_get_next_port_endpoint(port1, A2);   // NULL
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   drivers/of/property.c    | 22 ++++++++++++++++++++++
>   include/linux/of_graph.h | 20 ++++++++++++++++++++
>   2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 3b2d09c0376a..de56795a7362 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -692,6 +692,28 @@ struct device_node *of_graph_get_next_port(struct device_node *parent,
>   }
>   EXPORT_SYMBOL(of_graph_get_next_port);
>   
> +/**
> + * of_graph_get_next_port_endpoint() - get next endpoint node in port.
> + * If it reached to end of the port, it will return NULL.
> + * @port: pointer to the target port node
> + * @endpoint: current endpoint node, or NULL to get first
> + *
> + * Return: An 'endpoint' node pointer with refcount incremented. Refcount
> + * of the passed @prev node is decremented.
> + */

Same issues here too. No "prev" parameter, and I suggest using 
"previous", not "current", to be consistent with 
of_graph_get_next_endpoint(). (or alternatively, change 
of_graph_get_next_endpoint()).

Oh, the declaration of the function uses "prev", but the implementation 
"endpoint". Please make the naming same.

> +struct device_node *of_graph_get_next_port_endpoint(const struct device_node *port,
> +						    struct device_node *endpoint)
> +{
> +	do {
> +		endpoint = of_get_next_child(port, endpoint);
> +		if (!endpoint)
> +			break;
> +	} while (!of_node_name_eq(endpoint, "endpoint"));
> +
> +	return endpoint;
> +}
> +EXPORT_SYMBOL(of_graph_get_next_port_endpoint);
> +
>   /**
>    * of_graph_get_next_endpoint() - get next endpoint node
>    *
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index 30169b50b042..8b4777938c5e 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -59,6 +59,17 @@ struct of_endpoint {
>   	for (child = of_graph_get_next_port(parent, NULL); child != NULL; \
>   	     child = of_graph_get_next_port(parent, child))
>   
> +/**
> + * for_each_of_graph_port_endpoint - iterate over every endpoint in a port node
> + * @parent: parent device or ports node

Hmm, shouldn't the parent be a port node?

> + * @child: loop variable pointing to the current endpoint node
> + *
> + * When breaking out of the loop, of_node_put(child) has to be called manually.
> + */
> +#define for_each_of_graph_port_endpoint(parent, child)			\
> +		for (child = of_graph_get_next_port_endpoint(parent, NULL); child != NULL; \
> +		     child = of_graph_get_next_port_endpoint(parent, child))
> +
>   #ifdef CONFIG_OF
>   bool of_graph_is_present(const struct device_node *node);
>   int of_graph_parse_endpoint(const struct device_node *node,
> @@ -73,6 +84,8 @@ struct device_node *of_graph_get_next_ports(struct device_node *parent,
>   					    struct device_node *ports);
>   struct device_node *of_graph_get_next_port(struct device_node *parent,
>   					   struct device_node *port);
> +struct device_node *of_graph_get_next_port_endpoint(const struct device_node *port,
> +						    struct device_node *prev);
>   struct device_node *of_graph_get_endpoint_by_regs(
>   		const struct device_node *parent, int port_reg, int reg);
>   struct device_node *of_graph_get_remote_endpoint(
> @@ -133,6 +146,13 @@ static inline struct device_node *of_graph_get_next_port(
>   	return NULL;
>   }
>   
> +static inline struct device_node *of_graph_get_next_port_endpoint(
> +					const struct device_node *parent,
> +					struct device_node *previous)
> +{
> +	return NULL;
> +}
> +
>   static inline struct device_node *of_graph_get_endpoint_by_regs(
>   		const struct device_node *parent, int port_reg, int reg)
>   {

  Tomi

