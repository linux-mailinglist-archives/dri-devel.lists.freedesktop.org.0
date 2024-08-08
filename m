Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15C794B88A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 10:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB4310E069;
	Thu,  8 Aug 2024 08:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="azIVX33y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD86210E069
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 08:06:32 +0000 (UTC)
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi
 [91.156.87.48])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1907B581;
 Thu,  8 Aug 2024 10:05:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1723104338;
 bh=m6WZVcmXq3vqWWwuRnSDzja+for6m0HnYPAgXqeXz5o=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=azIVX33ys0qGXuYpExnWr/+oel+rutrd5DhWpCWpKEAwsu5XFWcHJSKQslegVTsSg
 R8rcVfw8m35jHsw5XwHLcgYL9px8Vj9ncfjA+Mhoc0djqrnpYm3b+2GULj/DngMZ7Z
 6DEF88Uvm+OYBviUSVdfZOeLfWUicCs6EYEW+EUE=
Message-ID: <ca216286-b09a-4faf-8221-c88c21f4de0c@ideasonboard.com>
Date: Thu, 8 Aug 2024 11:06:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] of: property: add of_graph_get_next_port()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87mslqw8mj.wl-kuninori.morimoto.gx@renesas.com>
 <87le1aw8lw.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
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
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <87le1aw8lw.wl-kuninori.morimoto.gx@renesas.com>
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
> We have endpoint base functions
> 	- of_graph_get_next_device_endpoint()
> 	- of_graph_get_device_endpoint_count()
> 	- for_each_of_graph_device_endpoint()
> 
> Here, for_each_of_graph_device_endpoint() loop finds each endpoints
> 
> 	ports {
> 		port@0 {
> (1)			endpoint {...};
> 		};
> 		port@1 {
> (2)			endpoint {...};
> 		};
> 		...
> 	};
> 
> In above case, it finds endpoint as (1) -> (2) -> ...
> 
> Basically, user/driver knows which port is used for what, but not in
> all cases. For example on flexible/generic driver case, how many ports
> are used is not fixed.
> 
> For example Sound Generic Card driver which is used from many venders
> can't know how many ports are used. Because the driver is very
> flexible/generic, it is impossible to know how many ports are used,
> it depends on each vender SoC and/or its used board.
> 
> And more, the port can have multi endpoints. For example Generic Sound
> Card case, it supports many type of connection between CPU / Codec, and
> some of them uses multi endpoint in one port.
> Then, Generic Sound Card want to handle each connection via "port"
> instead of "endpoint".
> But, it is very difficult to handle each "port" via
> for_each_of_graph_device_endpoint(). Getting "port" by using
> of_get_parent() from "endpoint" doesn't work. see below.
> 
> 	ports {
> 		port@0 {
> (1)			endpoint@0 {...};
> (2)			endpoint@1 {...};
> 		};
> 		port@1 {
> (3)			endpoint {...};
> 		};
> 		...
> 	};
> 
> In the same time, same reason, we want to handle "ports" same as "port".
> 
> 	node {
> =>		ports@0 {
> 			port@0 {
> 				endpoint@0 {...};
> 				endpoint@1 {...};
> 				...
> 			};
> 			port@1 {
> 				endpoint@0 {...};
> 				endpoint@1 {...};
> 				...
> 			};
> 			...
> 		};
> =>		ports@1 {
> 			...
> 		};
> 	};
> 
> Add "ports" / "port" base functions.
> For above case, we can use
> 
> 	for_each_of_graph_ports(node, ports) {
> 		for_each_of_graph_port(ports, port) {
> 			...
> 		}
> 	}
> 
> This loop works in case of "node" doesn't have "ports" also.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   drivers/of/property.c    | 86 ++++++++++++++++++++++++++++++++++++++++
>   include/linux/of_graph.h | 47 ++++++++++++++++++++++
>   2 files changed, 133 insertions(+)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 164d77cb9445..3b2d09c0376a 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -625,8 +625,76 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
>   }
>   EXPORT_SYMBOL(of_graph_get_port_by_id);
>   
> +/**
> + * of_graph_get_next_ports() - get next ports node.
> + * @parent: pointer to the parent device node
> + * @ports: current ports node, or NULL to get first
> + *
> + * Return: A 'ports' node pointer with refcount incremented. Refcount
> + * of the passed @prev node is decremented.

No "prev" argument in the code.

The of_graph_get_next_endpoint() function uses "previous" as the 
argument name (well, the function declaration uses "previous", the 
implementation uses "prev"...), and I would use the same naming here.

Also of_graph_get_next_endpoint() talks about "previous endpoint node", 
whereas here it's "current ports node". I'd use the same style here, so 
"previous ports node".

The same comments for the of_graph_get_next_port().

> + */
> +struct device_node *of_graph_get_next_ports(struct device_node *parent,
> +					    struct device_node *ports)
> +{
> +	if (!parent)
> +		return NULL;
> +
> +	if (!ports) {
> +		ports = of_get_child_by_name(parent, "ports");
> +
> +		/* use parent as its ports of this device if it not exist */

I think this needs to be described in the kernel doc. I understand the 
need for this, but it's somewhat counter-intuitive that this returns the 
parent node if there are no ports nodes, so it must be highlighted in 
the documentation.

I wonder if a bit more complexity here would be good... I think here we 
could:

- If there are no 'ports' nodes in the parent, but there is a 'port' 
node in the parent, return the parent node
- If there are no 'ports' nor 'port' nodes in the parent, return NULL

> +		if (!ports) {
> +			ports = parent;
> +			of_node_get(ports);
> +		}

You could just do "ports = of_node_get(parent);"

> +
> +		return ports;
> +	}
> +
> +	do {
> +		ports = of_get_next_child(parent, ports);
> +		if (!ports)
> +			break;
> +	} while (!of_node_name_eq(ports, "ports"));
> +
> +	return ports;
> +}
> +EXPORT_SYMBOL(of_graph_get_next_ports);
> +
> +/**
> + * of_graph_get_next_port() - get next port node.
> + * @parent: pointer to the parent device node
> + * @port: current port node, or NULL to get first
> + *
> + * Return: A 'port' node pointer with refcount incremented. Refcount
> + * of the passed @prev node is decremented.
> + */
> +struct device_node *of_graph_get_next_port(struct device_node *parent,
> +					   struct device_node *port)
> +{
> +	if (!parent)
> +		return NULL;
> +
> +	if (!port) {
> +		struct device_node *ports __free(device_node) =
> +			of_graph_get_next_ports(parent, NULL);
> +
> +		return of_get_child_by_name(ports, "port");
> +	}
> +
> +	do {
> +		port = of_get_next_child(parent, port);
> +		if (!port)
> +			break;
> +	} while (!of_node_name_eq(port, "port"));
> +
> +	return port;
> +}

Hmm... So if I call this with of_graph_get_next_port(dev_node, NULL) 
(dev_node being the device node of the device), it'll give me the first 
port in the first ports node, or the first port in the dev_node if there 
are no ports nodes?

And if I then continue iterating with of_graph_get_next_port(dev_node, 
prev_port)... The call will return NULL if the dev_node contains "ports" 
node (because the dev_node does not contain any "port" nodes)?

So if I understand right, of_graph_get_next_port() must always be called 
with a parent that contains port nodes. Sometimes that's the device's 
node (if there's just one port) and sometimes that's ports node. If it's 
called with a parent that contains ports node, it will not work correctly.

If the above is right, then should this just return 
"of_get_child_by_name(parent, "port")" if !port, instead of calling 
of_graph_get_next_ports()?

Or maybe I'm just getting confused here. But in any case, I think it 
would be very good to describe the behavior on the kernel doc for the 
different ports/port structure cases (also for 
of_graph_get_next_ports()), and be clear on what the parameters can be, 
i.e. what kind of device nodes can be given as parent, and how the 
function iterates over the ports.

> +EXPORT_SYMBOL(of_graph_get_next_port);
> +
>   /**
>    * of_graph_get_next_endpoint() - get next endpoint node
> + *

Extra change.

>    * @parent: pointer to the parent device node
>    * @prev: previous endpoint node, or NULL to get first
>    *
> @@ -823,6 +891,24 @@ unsigned int of_graph_get_endpoint_count(const struct device_node *np)
>   }
>   EXPORT_SYMBOL(of_graph_get_endpoint_count);
>   
> +/**
> + * of_graph_get_port_count() - get count of port

Perhaps "get the number of port nodes".

> + * @np: pointer to the parent device node
> + *
> + * Return: count of port of this device node
> + */
> +unsigned int of_graph_get_port_count(struct device_node *np)
> +{
> +	struct device_node *port = NULL;
> +	int num = 0;
> +
> +	for_each_of_graph_port(np, port)
> +		num++;
> +
> +	return num;
> +}

I my analysis above is right, calling of_graph_get_port_count(dev_node) 
will return 1, if the dev_node contains "ports" node which contains one 
or more "port" nodes.

> +EXPORT_SYMBOL(of_graph_get_port_count);
> +
>   /**
>    * of_graph_get_remote_node() - get remote parent device_node for given port/endpoint
>    * @node: pointer to parent device_node containing graph port/endpoint
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index a4bea62bfa29..30169b50b042 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -37,14 +37,42 @@ struct of_endpoint {
>   	for (child = of_graph_get_next_endpoint(parent, NULL); child != NULL; \
>   	     child = of_graph_get_next_endpoint(parent, child))
>   
> +/**
> + * for_each_of_graph_ports - iterate over every ports in a device node
> + * @parent: parent device node containing ports
> + * @child: loop variable pointing to the current ports node
> + *
> + * When breaking out of the loop, of_node_put(child) has to be called manually.
> + */
> +#define for_each_of_graph_ports(parent, child)				\
> +	for (child = of_graph_get_next_ports(parent, NULL); child != NULL; \
> +	     child = of_graph_get_next_ports(parent, child))
> +
> +/**
> + * for_each_of_graph_port - iterate over every port in a device or ports node
> + * @parent: parent device or ports node containing port
> + * @child: loop variable pointing to the current port node
> + *
> + * When breaking out of the loop, of_node_put(child) has to be called manually.
> + */
> +#define for_each_of_graph_port(parent, child)			\
> +	for (child = of_graph_get_next_port(parent, NULL); child != NULL; \
> +	     child = of_graph_get_next_port(parent, child))
> +
>   #ifdef CONFIG_OF
>   bool of_graph_is_present(const struct device_node *node);
>   int of_graph_parse_endpoint(const struct device_node *node,
>   				struct of_endpoint *endpoint);
> +

Extra change.

>   unsigned int of_graph_get_endpoint_count(const struct device_node *np);
> +unsigned int of_graph_get_port_count(struct device_node *np);
>   struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
>   struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
>   					struct device_node *previous);
> +struct device_node *of_graph_get_next_ports(struct device_node *parent,
> +					    struct device_node *ports);
> +struct device_node *of_graph_get_next_port(struct device_node *parent,
> +					   struct device_node *port);
>   struct device_node *of_graph_get_endpoint_by_regs(
>   		const struct device_node *parent, int port_reg, int reg);
>   struct device_node *of_graph_get_remote_endpoint(
> @@ -73,6 +101,11 @@ static inline unsigned int of_graph_get_endpoint_count(const struct device_node
>   	return 0;
>   }
>   
> +static inline unsigned int of_graph_get_port_count(struct device_node *np)
> +{
> +	return 0;
> +}
> +
>   static inline struct device_node *of_graph_get_port_by_id(
>   					struct device_node *node, u32 id)
>   {
> @@ -86,6 +119,20 @@ static inline struct device_node *of_graph_get_next_endpoint(
>   	return NULL;
>   }
>   
> +static inline struct device_node *of_graph_get_next_ports(
> +					struct device_node *parent,
> +					struct device_node *previous)
> +{
> +	return NULL;
> +}
> +
> +static inline struct device_node *of_graph_get_next_port(
> +					struct device_node *parent,
> +					struct device_node *previous)
> +{
> +	return NULL;
> +}
> +
>   static inline struct device_node *of_graph_get_endpoint_by_regs(
>   		const struct device_node *parent, int port_reg, int reg)
>   {

  Tomi

